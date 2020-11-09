import 'package:fitemos/src/utils/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:fitemos/src/benchMark/historyPage.dart';
import 'package:fitemos/src/utils/apiDataSource.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:localstorage/localstorage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Modifier extends StatefulWidget {
  dynamic currentLevel;
  Modifier({Key key, this.currentLevel}) : super(key: key);

  @override
  _modifierState createState() => _modifierState();
}

class _modifierState extends State<Modifier> {
  get currentLevel => widget.currentLevel;
  dynamic levelData;
  RestDatasource api = new RestDatasource();
  final LocalStorage storage = new LocalStorage('fitemos_store');
  TextEditingController valController = new TextEditingController();
  bool isUpdated = false;
  double tempVal = 0;
  int changedLevel;

  FontWeight fontWeightVal1 = FontWeight.w600;
  double fontSizeVal1 = 14;
  Color fontColorVal1 = Color(0xff333333);

  FontWeight fontWeightVal2 = FontWeight.w600;
  double fontSizeVal2 = 14;
  Color fontColorVal2 = Color(0xff333333);

  FontWeight fontWeightVal3 = FontWeight.w600;
  double fontSizeVal3 = 14;
  Color fontColorVal3 = Color(0xff333333);

  FontWeight fontWeightVal4 = FontWeight.w600;
  double fontSizeVal4 = 14;
  Color fontColorVal4 = Color(0xff333333);

  FontWeight fontWeightVal5 = FontWeight.w600;
  double fontSizeVal5 = 14;
  Color fontColorVal5 = Color(0xff333333);

  _getCurrentLevel(String pageSize, String pageNumber) async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();
    api
        .getCurrentLevel(pageSize, pageNumber, accessToken)
        .then((Account level) {
      setState(() {
        isUpdated = true;
        tempVal = double.parse(level.returnData['current'].toString());
        levelData = level.returnData;
        reInitSate();
      });
    }).catchError((error) {});
  }

  _updateLevel(int level) async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api.updateLevel(level, accessToken).then((Account level) {
      _getCurrentLevel('100', '0');
    }).catchError((error) {});
  }

  void reInitSate() {
    if (tempVal > 0 && tempVal < 20) {
      setState(() {
        fontWeightVal1 = FontWeight.w800;
        fontSizeVal1 = 20;
        fontColorVal1 = Color(0xff51AB80);

        fontWeightVal2 = FontWeight.w600;
        fontSizeVal2 = 14;
        fontColorVal2 = Color(0xff333333);
        fontWeightVal3 = FontWeight.w600;
        fontSizeVal3 = 14;
        fontColorVal3 = Color(0xff333333);
        fontWeightVal4 = FontWeight.w600;
        fontSizeVal4 = 14;
        fontColorVal4 = Color(0xff333333);
        fontWeightVal5 = FontWeight.w600;
        fontSizeVal5 = 14;
        fontColorVal5 = Color(0xff333333);
        changedLevel = 1;
      });
    } else if (tempVal > 19 && tempVal < 40) {
      setState(() {
        fontWeightVal2 = FontWeight.w800;
        fontSizeVal2 = 20;
        fontColorVal2 = Color(0xff51AB80);

        fontWeightVal1 = FontWeight.w600;
        fontSizeVal1 = 14;
        fontColorVal1 = Color(0xff333333);
        fontWeightVal3 = FontWeight.w600;
        fontSizeVal3 = 14;
        fontColorVal3 = Color(0xff333333);
        fontWeightVal4 = FontWeight.w600;
        fontSizeVal4 = 14;
        fontColorVal4 = Color(0xff333333);
        fontWeightVal5 = FontWeight.w600;
        fontSizeVal5 = 14;
        fontColorVal5 = Color(0xff333333);
        changedLevel = 2;
      });
    } else if (tempVal > 39 && tempVal < 60) {
      setState(() {
        fontWeightVal3 = FontWeight.w800;
        fontSizeVal3 = 20;
        fontColorVal3 = Color(0xff51AB80);

        fontWeightVal1 = FontWeight.w600;
        fontSizeVal1 = 14;
        fontColorVal1 = Color(0xff333333);
        fontWeightVal2 = FontWeight.w600;
        fontSizeVal2 = 14;
        fontColorVal2 = Color(0xff333333);
        fontWeightVal4 = FontWeight.w600;
        fontSizeVal4 = 14;
        fontColorVal4 = Color(0xff333333);
        fontWeightVal5 = FontWeight.w600;
        fontSizeVal5 = 14;
        fontColorVal5 = Color(0xff333333);
        changedLevel = 3;
      });
    } else if (tempVal > 59 && tempVal < 80) {
      setState(() {
        fontWeightVal4 = FontWeight.w800;
        fontSizeVal4 = 20;
        fontColorVal4 = Color(0xff51AB80);

        fontWeightVal1 = FontWeight.w600;
        fontSizeVal1 = 14;
        fontColorVal1 = Color(0xff333333);
        fontWeightVal2 = FontWeight.w600;
        fontSizeVal2 = 14;
        fontColorVal2 = Color(0xff333333);
        fontWeightVal3 = FontWeight.w600;
        fontSizeVal3 = 14;
        fontColorVal3 = Color(0xff333333);
        fontWeightVal5 = FontWeight.w600;
        fontSizeVal5 = 14;
        fontColorVal5 = Color(0xff333333);
        changedLevel = 4;
      });
    } else if (tempVal > 79) {
      setState(() {
        fontWeightVal5 = FontWeight.w800;
        fontSizeVal5 = 20;
        fontColorVal5 = Color(0xff51AB80);

        fontWeightVal1 = FontWeight.w600;
        fontSizeVal1 = 14;
        fontColorVal1 = Color(0xff333333);
        fontWeightVal2 = FontWeight.w600;
        fontSizeVal2 = 14;
        fontColorVal2 = Color(0xff333333);
        fontWeightVal3 = FontWeight.w600;
        fontSizeVal3 = 14;
        fontColorVal3 = Color(0xff333333);
        fontWeightVal4 = FontWeight.w600;
        fontSizeVal4 = 14;
        fontColorVal4 = Color(0xff333333);
        changedLevel = 5;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    tempVal = double.parse(currentLevel['current'].toString());
    levelData = currentLevel;
    reInitSate();
  }

  Widget _backButton() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      height: 90,
      child: Row(
        children: <Widget>[
          InkWell(
              onTap: () {
                Navigator.pop(context, [isUpdated, changedLevel]);
              },
              child: Container(
                padding: EdgeInsets.only(left: 15, top: 12, bottom: 10),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              )),
          Container(
              padding: EdgeInsets.only(left: 6, top: 11, bottom: 10),
              child: Text('Nivel Físico',
                  style: GoogleFonts.rubik(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333333)))),
        ],
      ),
    );
  }

  Widget _thermometerLeft() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 145,
              height: 30,
              padding: const EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: RichText(
                    text: TextSpan(
                        text: 'Nivel Fisico 5',
                        style: GoogleFonts.rubik(
                            fontSize: fontSizeVal5,
                            fontWeight: fontWeightVal5,
                            color: fontColorVal5))),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 145,
              height: 30,
              padding: const EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: RichText(
                    text: TextSpan(
                        text: 'Nivel Fisico 4',
                        style: GoogleFonts.rubik(
                            fontSize: fontSizeVal4,
                            fontWeight: fontWeightVal4,
                            color: fontColorVal4))),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 145,
              height: 30,
              padding: const EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: RichText(
                    text: TextSpan(
                        text: 'Nivel Fisico 3',
                        style: GoogleFonts.rubik(
                            fontSize: fontSizeVal3,
                            fontWeight: fontWeightVal3,
                            color: fontColorVal3))),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 145,
              height: 30,
              padding: const EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: RichText(
                    text: TextSpan(
                        text: 'Nivel Fisico 2',
                        style: GoogleFonts.rubik(
                            fontSize: fontSizeVal2,
                            fontWeight: fontWeightVal2,
                            color: fontColorVal2))),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 145,
              height: 30,
              padding: const EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: RichText(
                    text: TextSpan(
                        text: 'Nivel Fisico 1',
                        style: GoogleFonts.rubik(
                            fontSize: fontSizeVal1,
                            fontWeight: fontWeightVal1,
                            color: fontColorVal1))),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _thermometerCenter1() {
    double volumeVal;
    if (tempVal > 80)
      volumeVal = 80;
    else
      volumeVal = tempVal;
    double volume = volumeVal / 80;

    return RotatedBox(
      quarterTurns: -1,
      child: new LinearPercentIndicator(
        width: 200.0,
        animation: true,
        animationDuration: 1000,
        lineHeight: 60.0,
        percent: volume,
        linearStrokeCap: LinearStrokeCap.butt,
        progressColor: Colors.red,
      ),
    );
  }

  Widget _thermometerCenter() {
    double volumeVal;
    if (tempVal > 80)
      volumeVal = 80;
    else
      volumeVal = tempVal;
    var volume = 170 / 80 * volumeVal;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 80,
        height: 170,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: 80,
              height: volume,
              color: Color(0xffff4b4b),
            )
          ],
        ),
      ),
    );
  }

  Widget _thermometerRight1() {
    return Padding(
        padding: EdgeInsets.only(left: 4, top: 40),
        child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                text: '30',
                style: GoogleFonts.rubik(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.red))));
  }

  Widget _thermometerRight() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: '+80',
                      style: GoogleFonts.rubik(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333)))),
            )
          ],
        ),
        SizedBox(height: 25),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: '60',
                      style: GoogleFonts.rubik(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333)))),
            )
          ],
        ),
        SizedBox(height: 25),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: '40',
                      style: GoogleFonts.rubik(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333)))),
            )
          ],
        ),
        SizedBox(height: 13),
        Container(width: 60, height: 2, color: Color(0xff333333)),
        SizedBox(height: 11.5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: '20',
                      style: GoogleFonts.rubik(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333)))),
            )
          ],
        ),
        SizedBox(height: 25),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: '0',
                      style: GoogleFonts.rubik(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333)))),
            )
          ],
        ),
      ],
    );
  }

  Widget _thermometerBody() {
    return InkWell(
        child: Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(child: _thermometerLeft()),
          // Container(child: _thermometerCenter()),
          Container(child: _thermometerCenter1()),
          Container(child: _thermometerRight()),
          Container(child: _thermometerRight1())
        ],
      ),
    ));
  }

  void updateBenchMark() {
    final doubleVal = double.parse(valController.text);
    setState(() {
      tempVal = doubleVal;
    });
    if (doubleVal > 0 && doubleVal < 20) {
      setState(() {
        fontWeightVal1 = FontWeight.w800;
        fontSizeVal1 = 20;
        fontColorVal1 = Color(0xff51AB80);

        fontWeightVal2 = FontWeight.w600;
        fontSizeVal2 = 14;
        fontColorVal2 = Color(0xff333333);
        fontWeightVal3 = FontWeight.w600;
        fontSizeVal3 = 14;
        fontColorVal3 = Color(0xff333333);
        fontWeightVal4 = FontWeight.w600;
        fontSizeVal4 = 14;
        fontColorVal4 = Color(0xff333333);
        fontWeightVal5 = FontWeight.w600;
        fontSizeVal5 = 14;
        fontColorVal5 = Color(0xff333333);
        changedLevel = 1;
      });
    } else if (doubleVal > 19 && doubleVal < 40) {
      setState(() {
        fontWeightVal2 = FontWeight.w800;
        fontSizeVal2 = 20;
        fontColorVal2 = Color(0xff51AB80);

        fontWeightVal1 = FontWeight.w600;
        fontSizeVal1 = 14;
        fontColorVal1 = Color(0xff333333);
        fontWeightVal3 = FontWeight.w600;
        fontSizeVal3 = 14;
        fontColorVal3 = Color(0xff333333);
        fontWeightVal4 = FontWeight.w600;
        fontSizeVal4 = 14;
        fontColorVal4 = Color(0xff333333);
        fontWeightVal5 = FontWeight.w600;
        fontSizeVal5 = 14;
        fontColorVal5 = Color(0xff333333);
        changedLevel = 2;
      });
    } else if (doubleVal > 39 && doubleVal < 60) {
      setState(() {
        fontWeightVal3 = FontWeight.w800;
        fontSizeVal3 = 20;
        fontColorVal3 = Color(0xff51AB80);

        fontWeightVal1 = FontWeight.w600;
        fontSizeVal1 = 14;
        fontColorVal1 = Color(0xff333333);
        fontWeightVal2 = FontWeight.w600;
        fontSizeVal2 = 14;
        fontColorVal2 = Color(0xff333333);
        fontWeightVal4 = FontWeight.w600;
        fontSizeVal4 = 14;
        fontColorVal4 = Color(0xff333333);
        fontWeightVal5 = FontWeight.w600;
        fontSizeVal5 = 14;
        fontColorVal5 = Color(0xff333333);
        changedLevel = 3;
      });
    } else if (doubleVal > 59 && doubleVal < 80) {
      setState(() {
        fontWeightVal4 = FontWeight.w800;
        fontSizeVal4 = 20;
        fontColorVal4 = Color(0xff51AB80);

        fontWeightVal1 = FontWeight.w600;
        fontSizeVal1 = 14;
        fontColorVal1 = Color(0xff333333);
        fontWeightVal2 = FontWeight.w600;
        fontSizeVal2 = 14;
        fontColorVal2 = Color(0xff333333);
        fontWeightVal3 = FontWeight.w600;
        fontSizeVal3 = 14;
        fontColorVal3 = Color(0xff333333);
        fontWeightVal5 = FontWeight.w600;
        fontSizeVal5 = 14;
        fontColorVal5 = Color(0xff333333);
        changedLevel = 4;
      });
    } else if (doubleVal > 79) {
      setState(() {
        fontWeightVal5 = FontWeight.w800;
        fontSizeVal5 = 20;
        fontColorVal5 = Color(0xff51AB80);
        fontWeightVal1 = FontWeight.w600;
        fontSizeVal1 = 14;
        fontColorVal1 = Color(0xff333333);
        fontWeightVal2 = FontWeight.w600;
        fontSizeVal2 = 14;
        fontColorVal2 = Color(0xff333333);
        fontWeightVal3 = FontWeight.w600;
        fontSizeVal3 = 14;
        fontColorVal3 = Color(0xff333333);
        fontWeightVal4 = FontWeight.w600;
        fontSizeVal4 = 14;
        fontColorVal4 = Color(0xff333333);
        changedLevel = 5;
      });
    }
    _updateLevel(tempVal.toInt());
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
                    updateBenchMark();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    padding: EdgeInsets.symmetric(vertical: 6),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        color: Color(0xff1A7998)),
                    child: Text(
                      'Ingresar',
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
          var result = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => History(currentLevel: levelData)));
          print(result);
          if (result) {
            _getCurrentLevel('100', '0');
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                            text: 'Máximos Burpees en 5:00 minutos.',
                            style: GoogleFonts.rubik(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Color(0xff000000)))),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                            text: 'Ingresar Repeticiones',
                            style: GoogleFonts.rubik(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Color(0xff000000)))),
                  ),
                  SizedBox(height: 10),
                  _setInputValue(),
                  SizedBox(height: 20),
                  _thermometerBody(),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                            text:
                                'En este prueba determinaremos el nivel de condición física. La intensidad del programa se ajustará en función del resultado. Esta prueba se recomienda realizarla en una ventana mínima de dos semanas entre pruebas. Al realizarla ingresaremos nuestro puntaje en el recuadro inferior.',
                            style: GoogleFonts.rubik(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff333333)))),
                  ),
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
