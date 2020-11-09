import 'dart:async';
import 'package:fitemos/src/utils/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:fitemos/src/account/weightHistory.dart';
import 'package:fitemos/src/utils/apiDataSource.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:localstorage/localstorage.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:page_transition/page_transition.dart';
import 'package:fitemos/src/page_transition.dart';

class WeightSetting extends StatefulWidget {
  WeightSetting({Key key}) : super(key: key);

  @override
  _weightSettingState createState() => _weightSettingState();
}

class _weightSettingState extends State<WeightSetting> {
  RestDatasource api = new RestDatasource();
  final LocalStorage storage = new LocalStorage('fitemos_store');
  TextEditingController valController = new TextEditingController();
  DateTime selectedDate = DateTime.now();
  dynamic itemHistories;
  bool isEdit = false;
  String editItemId;
  bool isUpdated = false;
  bool clickFlag = true;

  @override
  void initState() {
    super.initState();
  }

  _getItemHistory() async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api.getWeightHistory(accessToken).then((Account returnVal) async {
      var result = await Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeft, //leftToRight,
              child: WeightHistory(historyData: returnVal.returnData)));
      if (result[0] == 'edit') {
        setState(() {
          valController.text = result[1].toString();
          isEdit = true;
          editItemId = result[2].toString();
          selectedDate = DateTime.parse(result[3].toString());
        });
      } else if (result[0] == 'delete') {
        setState(() {
          isEdit = false;
          selectedDate = DateTime.now();
          if (result[1]) isUpdated = true;
        });
      } else {}
      if (result[0] != null) {
        setState(() {
          clickFlag = true;
        });
      }
    }).catchError((error) {});
  }

  _updateWeight(String itemId, String date, String repetition) async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api
        .updateWeight(itemId, date, repetition, accessToken)
        .then((Account returnVal) async {
      valController.text = '';
      setState(() {
        isUpdated = true;
      });
    }).catchError((error) {});
  }

  _addWeight(String date, String repetition) async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api
        .addWeight(date, repetition, accessToken)
        .then((Account returnVal) async {
      valController.text = '';
      setState(() {
        isUpdated = true;
      });
    }).catchError((error) {
      print(error);
    });
  }

  Widget _backButton() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      height: 90,
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pop(context, isUpdated);
            },
            child: Container(
              padding: EdgeInsets.only(left: 15, top: 12, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 6, top: 11, bottom: 10),
              child: Text('Monitoreo de peso corporal',
                  style: GoogleFonts.rubik(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333333)))),
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
                      hintText: 'Ingrese peso',
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
                        _updateWeight(
                            editItemId,
                            "${selectedDate.toLocal()}".split(' ')[0],
                            valController.text);
                      else
                        _addWeight("${selectedDate.toLocal()}".split(' ')[0],
                            valController.text);
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    padding: EdgeInsets.symmetric(vertical: 6),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        color: Color(0xff1A7998)),
                    child: Text(
                      'Guardar',
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
        onTap: () async {
          if (clickFlag) {
            setState(() {
              clickFlag = false;
            });
            _getItemHistory();
          }
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
      });
  }

  Widget _getSelectDate() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                child: Text("${selectedDate.toLocal()}".split(' ')[0],
                    textAlign: TextAlign.left,
                    style: GoogleFonts.rubik(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff333333))),
              )),
          Padding(
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
                  )))
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
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                            text:
                                'Para tener un monitoreo real de tu peso. Debes ser consistente en cada medición. Te recomendamos pesarte antes del desayuno sin ropa pesada y sin zapatos.',
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
