import 'dart:async';
import 'package:fitemos/src/utils/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:fitemos/src/benchMark/benchHistory.dart';
import 'package:fitemos/src/utils/apiDataSource.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:localstorage/localstorage.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:page_transition/page_transition.dart';

class BenchDetail extends StatefulWidget {
  dynamic params, historyData;
  BenchDetail({Key key, this.params, this.historyData}) : super(key: key);

  @override
  _benchDetailState createState() => _benchDetailState();
}

class _benchDetailState extends State<BenchDetail> {
  get benchDetails => widget.params;
  get historyData => widget.historyData;
  RestDatasource api = new RestDatasource();
  final LocalStorage storage = new LocalStorage('fitemos_store');
  TextEditingController valController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();
  List<double> chartAxis = [];
  List<DataPoint> chartData = [];
  String chartProgress = '';
  DateTime selectedDate = DateTime.now();
  dynamic itemHistories;
  bool isEdit = false;
  String editItemId;

  @override
  void initState() {
    super.initState();
    if (historyData['published'] != null) {
      if (historyData['published'].length > 0) {
        int countHistory = historyData['published'].length;
        DateTime startDate = DateTime.parse(
            historyData['published'][countHistory - 1]['recording_date']);
        chartProgress =
            historyData['published'][0]['recording_date'].toString();
        for (var i = countHistory - 1; i >= 0; i--) {
          DateTime endDate =
              DateTime.parse(historyData['published'][i]['recording_date']);
          int daysToGenerate = endDate.difference(startDate).inDays;
          chartAxis.add(daysToGenerate.toDouble());
          chartData.add(DataPoint<double>(
              value: double.parse(
                  historyData['published'][i]['repetition'].toString()),
              xAxis: daysToGenerate.toDouble()));
        }
      } else {
        chartAxis = [0, 10, 20];
        chartData = [
          DataPoint<double>(value: 0, xAxis: 0),
          DataPoint<double>(value: 0, xAxis: 10),
          DataPoint<double>(value: 0, xAxis: 20),
        ];
      }
    } else {
      chartAxis = [0, 10, 20];
      chartData = [
        DataPoint<double>(value: 0, xAxis: 0),
        DataPoint<double>(value: 0, xAxis: 10),
        DataPoint<double>(value: 0, xAxis: 20),
      ];
    }

    dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
  }

  _getHistory(String itemId) async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api.getItemHistory(itemId, accessToken).then((Account history) {
      dynamic chartHistories = history.returnData;
      setState(() {
        chartAxis = [];
        chartData = [];
        chartProgress = '';
        if (chartHistories['published'] != null) {
          if (chartHistories['published'].length > 0) {
            int countHistory = chartHistories['published'].length;
            /*DateTime startDate = DateTime.parse(chartHistories['labels'][0]);
            chartProgress = chartHistories['data']
                    [chartHistories['data'].length - 1]
                .toString();
            for (var i = 0; i < chartHistories['labels'].length; i++) {
              DateTime endDate = DateTime.parse(chartHistories['labels'][i]);
              int daysToGenerate = endDate.difference(startDate).inDays;
              chartAxis.add(daysToGenerate.toDouble());
              chartData.add(DataPoint<double>(
                  value: double.parse(chartHistories['data'][i].toString()),
                  xAxis: daysToGenerate.toDouble()));
            }*/
            DateTime startDate = DateTime.parse(
                chartHistories['published'][countHistory - 1]['recording_date']);
            chartProgress =
                chartHistories['published'][0]['recording_date'].toString();
            for (var i = countHistory - 1; i >= 0; i--) {
              DateTime endDate =
                  DateTime.parse(chartHistories['published'][i]['recording_date']);
              int daysToGenerate = endDate.difference(startDate).inDays;
              chartAxis.add(daysToGenerate.toDouble());
              chartData.add(DataPoint<double>(
                  value: double.parse(
                      chartHistories['published'][i]['repetition'].toString()),
                  xAxis: daysToGenerate.toDouble()));
            }
          } else {
            chartAxis = [0, 10, 20];
            chartData = [
              DataPoint<double>(value: 0, xAxis: 0),
              DataPoint<double>(value: 0, xAxis: 10),
              DataPoint<double>(value: 0, xAxis: 20),
            ];
          }
        } else {
          chartAxis = [0, 10, 20];
          chartData = [
            DataPoint<double>(value: 0, xAxis: 0),
            DataPoint<double>(value: 0, xAxis: 10),
            DataPoint<double>(value: 0, xAxis: 20),
          ];
        }
      });
    }).catchError((error) {
      print(error);
    });
  }

  _getItemHistory(String itemId) async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api.getItemHistory(itemId, accessToken).then((Account history) async {
      valController.text = '';
      selectedDate = DateTime.now();
      setState(() {
        itemHistories = history.returnData;
      });
      var result = await Navigator.push(
          context,
          // PageTransition(
          //     type: PageTransitionType.rightToLeft, //leftToRight,
          //     child: BenchHistory(historyData: itemHistories))
          MaterialPageRoute(
              builder: (context) => BenchHistory(historyData: itemHistories)));
      print(result);
      if (result[0] == 'edit') {
        setState(() {
          valController.text = result[1].toString();
          isEdit = true;
          editItemId = result[2].toString();
          selectedDate = DateTime.parse(result[3].toString());
        });
      } else {
        if (result[1]) _getHistory(itemId);
        isEdit = false;
      }
    }).catchError((error) {});
  }

  _updateBenchMark(String itemId, String date, String repetition) async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api
        .updateBenchMark(itemId, date, repetition, accessToken)
        .then((Account returnVal) async {
      valController.text = '';
      _getHistory(itemId);
    }).catchError((error) {});
  }

  _addBenchMark(String itemId, String date, String repetition) async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api
        .addBenchMark(itemId, date, repetition, accessToken)
        .then((Account returnVal) async {
      valController.text = '';
      _getHistory(itemId);
    }).catchError((error) {
      print(error);
    });
  }

  Widget _backButton() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 15, top: 12, bottom: 10),
                  child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 6, top: 11, bottom: 10),
                  child: Text(benchDetails['title'],
                      style: GoogleFonts.rubik(
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333)))),
            ],
          ),
          new Row(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 11, bottom: 5),
                  child: Text(benchDetails['time'],
                      style: GoogleFonts.rubik(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey))),
              Container(
                  padding:
                      EdgeInsets.only(left: 5, top: 11, right: 15, bottom: 5),
                  child: Text('minutos',
                      style: GoogleFonts.rubik(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey))),
            ],
          )
        ],
      ),
    );
  }

  Widget _setInputValue() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextField(
                    controller: valController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                          borderSide: BorderSide(color: Colors.blue)),
                      fillColor: Color(0xffFFFFFF),
                      filled: true,
                      isDense: true,
                      contentPadding: EdgeInsets.all(7),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                  ))),
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: InkWell(
                  onTap: () {
                    if (valController.text != '') {
                      if (isEdit)
                        _updateBenchMark(
                            editItemId,
                            "${selectedDate.toLocal()}".split(' ')[0],
                            valController.text);
                      else
                        _addBenchMark(
                            benchDetails['id'].toString(),
                            "${selectedDate.toLocal()}".split(' ')[0],
                            valController.text);
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    padding: EdgeInsets.symmetric(vertical: 6),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        color: Color(0xff1A7998)),
                    child: Text(
                      'Guardar Puntaje',
                      style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffFFFFFF)),
                    ),
                  )))
        ],
      ),
    );
  }

  Widget _viewHistoryButton() {
    return InkWell(
        onTap: () {
          _getItemHistory(benchDetails['id'].toString());
        },
        onDoubleTap: () {
          _getItemHistory(benchDetails['id'].toString());
        },
        child: Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              padding: EdgeInsets.symmetric(vertical: 6),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  border: Border.all(
                      color: Color(0xff333333),
                      width: 1.0,
                      style: BorderStyle.solid),
                  color: Colors.transparent),
              child: Text(
                'Ver historial',
                style: GoogleFonts.rubik(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff333333)),
              ),
            )));
  }

  Widget _ProgressItem() {
    final width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: width,
        height: 250,
        child: BezierChart(
          bezierChartScale: BezierChartScale.CUSTOM,
          xAxisCustomValues: chartAxis,
          series: [
            BezierLine(
              lineColor: Color(0xffAFCA32),
              lineStrokeWidth: 4.0,
              data: chartData,
            ),
          ],
          config: BezierChartConfig(
            showDataPoints: false,
            backgroundColor: Colors.white,
            snap: false,
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        locale: const Locale('es', 'ES'),
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
  }

  Widget _getSelectDate() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          /*Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                child: Text("${selectedDate.toLocal()}".split(' ')[0],
                    textAlign: TextAlign.left,
                    style: GoogleFonts.rubik(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff333333))),
              )),*/
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextField(
                    controller: dateController,
                    onTap: () {
                      _selectDate(context);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                          borderSide: BorderSide(color: Colors.blue)),
                      fillColor: Color(0xffFFFFFF),
                      filled: true,
                      isDense: true,
                      contentPadding: EdgeInsets.all(7),
                    ),
                    readOnly: true,
                    /*keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],*/ // Only numbers can be entered
                  ))),
          /*Padding(
              padding: const EdgeInsets.only(left: 20),
              child: InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    padding: EdgeInsets.symmetric(vertical: 6),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        color: Color(0xff1A7998)),
                    child: Text(
                      'Elegir fecha',
                      style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffFFFFFF)),
                    ),
                  )))*/
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: size.height,
      decoration: BoxDecoration(color: Color(0xffFFFFFF)),
      child: Stack(
        children: <Widget>[
          Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _backButton(),
                  _ProgressItem(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                            text: '${benchDetails['description']}',
                            style: GoogleFonts.rubik(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff333333)))),
                  ),
                  SizedBox(height: 30),
                  _setInputValue(),
                  SizedBox(height: 30),
                  _getSelectDate(),
                  SizedBox(height: 30),
                  _viewHistoryButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
