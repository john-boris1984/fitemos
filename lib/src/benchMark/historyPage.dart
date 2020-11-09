import 'package:fitemos/src/utils/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:fitemos/src/utils/apiDataSource.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:localstorage/localstorage.dart';
import 'package:google_fonts/google_fonts.dart';

class History extends StatefulWidget {
  dynamic currentLevel;
  History({Key key, this.currentLevel}) : super(key: key);

  @override
  _historyState createState() => _historyState();
}

class _historyState extends State<History> {
  get currentLevel => widget.currentLevel;
  RestDatasource api = new RestDatasource();
  final LocalStorage storage = new LocalStorage('fitemos_store');
  dynamic historyData;
  bool updateFlag = false;

  _getCurrentLevel(String pageSize, String pageNumber) async {
    // String accessToken = storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api
        .getCurrentLevel(pageSize, pageNumber, accessToken)
        .then((Account level) {
      setState(() {
        historyData = level.returnData['results']['data'];
      });
    }).catchError((error) {});
  }

  _deleteLevelHistory(int itemId) async {
    // print(itemId);
    // String accessToken = storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api.deleteLevelHistory(accessToken, itemId).then((Account deleteItem) {
      setState(() {
        updateFlag = true;
      });
      _getCurrentLevel('100', '0');
    }).catchError((error) {
      print(error);
    });
  }

  @override
  void initState() {
    super.initState();
    historyData = currentLevel['results']['data'];
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      color: Colors.blue,
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog notes = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      contentPadding: EdgeInsets.all(15.0),
      titlePadding: EdgeInsets.all(15.0),
      title: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
              text: 'Notes',
              style: GoogleFonts.rubik(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xff333333),
              ))),
      content: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
              text:
                  'Notes Notes Notes Notes Not es Not es Notes No tes Notes Notes No tes Notes Notes Not es Notes Not es Notes Not es Not es Not es Notes Notes Notes No tes Notes ',
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff333333),
              ))),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return notes;
      },
    );
  }

  Widget _actionButtons(item) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                border: Border.all(
                    color: Color(0xffB9B7B7),
                    width: 1.0,
                    style: BorderStyle.solid),
                color: Colors.transparent),
            child: IconButton(
              iconSize: 16.0,
              padding: EdgeInsets.all(0.0),
              icon: Icon(Icons.delete_forever),
              color: Colors.red,
              onPressed: () {
                _deleteLevelHistory(item['id']);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _historyItem(item) {
    final width = MediaQuery.of(context).size.width - 40;
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: width / 3,
            child: Text(
              '${item['repetition']}',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff333333)),
            ),
          ),
          Container(
            width: width / 3,
            child: Text(
              '${item['created_date']}',
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff333333)),
            ),
          ),
          Container(width: width / 3, child: _actionButtons(item)),
        ],
      ),
    );
  }

  Widget _hitoryHead() {
    final width = MediaQuery.of(context).size.width - 40;
    return Container(
      padding: EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: width / 3,
            child: Text(
              'Repeticiones',
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffB9B7B7)),
            ),
          ),
          Container(
            width: width / 3,
            child: Text(
              'Fecha',
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffB9B7B7)),
            ),
          ),
          Container(
            width: width / 3,
            child: Text(
              'Acciones',
              textAlign: TextAlign.right,
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffB9B7B7)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _backButton() {
    return Container(
      padding: EdgeInsets.only(top: 25),
      height: 80,
      child: Row(
        children: <Widget>[
          InkWell(
              onTap: () {
                Navigator.pop(context, updateFlag);
              },
              child: Container(
                padding: EdgeInsets.only(left: 15, top: 11, bottom: 10),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              )),
          Container(
            padding: EdgeInsets.only(left: 6, top: 11, bottom: 10),
            child: Text(
              'Historial',
              style: GoogleFonts.rubik(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    ListView listView = ListView.builder(
      itemCount: historyData != null ? historyData.length : 0,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _historyItem(historyData[index]),
            ],
          ),
        );
      },
    );

    Container listViewContainer = Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(color: Color(0xffFFFFFF)),
      child: listView,
    );

    return Scaffold(
        body: Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(color: Color(0xffFFFFFF)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(child: _backButton()),
          Container(child: _hitoryHead()),
          Flexible(
            child: listViewContainer,
            flex: 1,
          ),
        ],
      ),
    ));
  }
}
