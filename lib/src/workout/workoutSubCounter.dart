//import 'package:fitemos/src/widget/custom_switch.dart';
import 'package:fitemos/src/utils/session_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fitemos/src/widget/increaseWidget.dart';
import 'package:fitemos/src/widget/roundWidget.dart';
import 'package:fitemos/src/widget/timerWidget.dart';
import 'package:fitemos/src/widget/extraWidget.dart';
import 'package:fitemos/src/widget/heatingWidget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:localstorage/localstorage.dart';
import 'package:fitemos/src/utils/apiDataSource.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:slider_button/slider_button.dart';

class WorkoutSubCounter extends StatefulWidget {
  dynamic params;
  WorkoutSubCounter({Key key, this.params}) : super(key: key);

  @override
  _workoutSubCounter createState() => _workoutSubCounter();
}

class _workoutSubCounter extends State<WorkoutSubCounter>
    with SingleTickerProviderStateMixin {
  List<Tab> tabList = List();
  TabController _tabController;
  dynamic get workoutData => widget.params;
  int itemIndex = 1;
  int workoutItemsLength;
  dynamic workoutItem;
  dynamic prevWorkoutItem;
  String backTitle = '';
  String buttonLable = 'Siguiente';
  bool isCompleted = false;

  bool isTimer = false;
  String timerType = '';
  String timerWork = '';
  String timerRound = '';
  String timerRest = '';

  @override
  void initState() {
    super.initState();
    tabList.add(new Tab(
      text: 'Workout',
    ));
    tabList.add(new Tab(
      text: 'Notas',
    ));
    _tabController = new TabController(vsync: this, length: tabList.length);
    workoutItem = workoutData['blocks'][itemIndex];
    workoutItemsLength = workoutData['blocks'].length;
    if (workoutItemsLength < 3) buttonLable = 'Completar';
    backTitle = workoutData['short_date'];

    if (workoutItem['timer_type'] != null) {
      isTimer = true;
      timerType = workoutItem['timer_type'].toString();
      timerWork = workoutItem['timer_work'].toString();
      timerRound = workoutItem['timer_round'].toString();
      timerRest = workoutItem['timer_rest'];
    } else {
      isTimer = false;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  showConfirmDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      shape: RoundedRectangleBorder(
          //borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Color(0xff333333))),
      child: Text('Cancelar',
          style: GoogleFonts.rubik(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xff333333))),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      color: Colors.blue,
      child: Text('OK',
          style: GoogleFonts.rubik(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xff333333))),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context, isCompleted);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      // title: Text('Confirmación',
      //     style: GoogleFonts.rubik(
      //         fontSize: 20,
      //         fontWeight: FontWeight.bold,
      //         color: Color(0xff333333))),
      content: Text('El reloj sigue corriendo. ¿Quieres seguir adelante?',
          style: GoogleFonts.rubik(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff333333))),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        if (SessionManager.getStopWatchState()) {
          showConfirmDialog(context);
        } else {
          Navigator.pop(context, isCompleted);
        }
        // Navigator.pop(context, isCompleted);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 11, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Color(0xff333333)),
            ),
            Text(
              backTitle,
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabBar() {
    final height = MediaQuery.of(context).size.height;
    return InkWell(
      child: Container(
        child: new Column(
          children: <Widget>[
            Container(
                child: Material(
              color: Color(0xffFFFFFF),
              child: TabBar(
                  // physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  indicatorColor: Color(0xffAFCA32),
                  labelColor: Color(0xff333333),
                  unselectedLabelColor: Color(0xffB9B7B7),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333333)),
                  tabs: tabList),
            )),
            new Container(
              height: height * 0.42,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: <Widget>[
                  _workoutTab(),
                  _noteTab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  final LocalStorage storage = new LocalStorage('fitemos_store');
  RestDatasource api = new RestDatasource();

  _setCheck(String date) async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api.setCheck(date, false, accessToken).then((CheckVal returnVal) {
      print(returnVal.returnData['fromWorkout']);
    }).catchError((error) {
      print(error);
    });
  }

  String labelText = 'Sliding to Left';
  Widget _start() {
    return Container(
        padding: EdgeInsets.all(0.1),
        width: 200,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.circular(30),
        ),
        child: SliderButton(
            action: () {
              ///Do something here OnSlide
              setState(() {
                itemIndex = itemIndex + 1;
              });

              if (itemIndex < workoutItemsLength) {
                setState(() {
                  workoutItem = workoutData['blocks'][itemIndex];

                  prevWorkoutItem = workoutData['blocks'][itemIndex - 1];
                  String curDate = workoutData['short_date'];
                  String slug = prevWorkoutItem['slug'];
                  if (slug != null && !workoutData['read']) {
                    if (slug == 'sin_content' || slug == 'con_content') {
                      setState(() {
                        isCompleted = true;
                        _setCheck(curDate);
                        workoutData['read'] = true;
                      });
                    }
                  }

                  if (workoutItem['timer_type'] != null) {
                    isTimer = true;
                    timerType = workoutItem['timer_type'].toString();
                    timerWork = workoutItem['timer_work'].toString();
                    timerRound = workoutItem['timer_round'].toString();
                    timerRest = workoutItem['timer_rest'];
                  } else {
                    isTimer = false;
                  }
                });
              } else if (itemIndex == workoutItemsLength) {
                setState(() {
                  isCompleted = true;
                });
                Navigator.pop(context, isCompleted);
              }
              if (itemIndex == workoutItemsLength - 1) {
                setState(() {
                  buttonLable = 'Completar';
                });
              }
              if (workoutItem['timer_type'] == null) {
                setState(() {
                  isTimer = false;
                });
              } else {
                setState(() {
                  isTimer = true;
                });
              }
            },

            ///Put label over here
            label: Text(
              buttonLable,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
              textAlign: TextAlign.center,
            ),
            icon: Center(
                child: FaIcon(
              FontAwesomeIcons.arrowRight,
              color: Colors.white,
              //size: 20,
              semanticLabel: 'Text to announce in accessibility modes',
            )),

            ///Change All the color and size from here.
            width: 200,
            height: 43,
            buttonSize: 40,
            //radius: 10,
            buttonColor: Colors.green, //Color(0xffd60000),
            backgroundColor: Colors.transparent, //Color(0xff534bae),
            highlightedColor: Colors.white,
            baseColor: Colors.grey, //Colors.red,
            dismissible: false,
            dismissThresholds: 0.8));
  }

  Widget _buttonGroup() {
    return InkWell(
        child: Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Padding(padding: EdgeInsets.only(right: 18), child: _workout()),
          Padding(padding: EdgeInsets.only(left: 18), child: _start()),
        ],
      ),
    ));
  }

  showAlertDialog(BuildContext context, String modalTitle, String modalBody) {
    // set up the button
    Widget okButton = FlatButton(
      color: Colors.blue,
      child: Text(
        "OK",
        style: GoogleFonts.rubik(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Color(0xff333333)),
      ),
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
              text: modalTitle,
              style: GoogleFonts.rubik(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xff333333),
              ))),
      content: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
              text: modalBody,
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

  Widget _itemContent(item) {
    if (item['tag'] == "h1") {
      return Container(
          margin: EdgeInsets.only(top: 20),
          child: RichText(
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              text: TextSpan(
                  text: item['content'],
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff333333),
                  ))));
    } else if (item['tag'] == "h2") {
      return Container(
          margin: EdgeInsets.only(top: 20),
          child: RichText(
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              text: TextSpan(
                  text: item['content'],
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff333333),
                  ))));
    } else if (item['tag'] == "modal") {
      return Container(
          margin: EdgeInsets.only(top: 10),
          child: SizedBox(
              height: 25,
              child: FlatButton(
                  color: Color(0xffcacaca),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  onPressed: () {
                    showAlertDialog(context, item['title'], item['body']);
                  },
                  child: Text(
                    item['title'],
                    style: GoogleFonts.rubik(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff333333)),
                  ))));
    } else {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Wrap(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 3, right: 10),
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                    text: item['before_content'],
                    style: GoogleFonts.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff333333),
                    )),
              ),
            ),
            item['youtube'] != null
                ? SizedBox(
                    height: 25,
                    child: FlatButton(
                        color: Color(0xffcacaca),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        onPressed: () async {
                          if (await canLaunch(
                              'https://www.youtube.com/watch?v=${item['youtube']['vid']}')) {
                            await launch(
                                'https://www.youtube.com/watch?v=${item['youtube']['vid']}');
                          }
                        },
                        child: Text(
                          item['youtube']['name'],
                          style: GoogleFonts.rubik(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333)),
                        )))
                : Container(
                    width: 0,
                  ),
            Container(
              padding: EdgeInsets.only(top: 3, right: 10),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: item['after_content'],
                      style: GoogleFonts.rubik(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff333333),
                      ))),
            ),
            Container(
              padding: EdgeInsets.only(top: 3, right: 10),
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                    text: item['after_content'],
                    style: GoogleFonts.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff333333),
                    )),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _workoutWidget() {
    return Container(
        child: ListView.builder(
      padding: EdgeInsets.all(0.0),
      itemCount: workoutItem['content'].length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _itemContent(workoutItem['content'][index]),
            ],
          ),
        );
      },
    ));
  }

  Widget _workoutTab() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: _workoutWidget(),
          ),
        ],
      ),
    );
  }

  Widget _noteWidget() {
    return Container(
        child: ListView.builder(
      padding: EdgeInsets.all(0.0),
      itemCount: workoutItem['note'].length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _itemContent(workoutItem['note'][index]),
            ],
          ),
        );
      },
    ));
  }

  Widget _noteTab() {
    // String ptag = getPTagContent();
    // return Container(
    //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    //   child: RichText(
    //       textAlign: TextAlign.left,
    //       text: TextSpan(
    //           // text: workoutItem['note'] != null
    //           //     ? workoutItem['note'][1]['before_content']
    //           //     : ' ',
    //           text: ptag,
    //           style: GoogleFonts.rubik(
    //             fontSize: 14,
    //             fontWeight: FontWeight.w500,
    //             color: Color(0xff333333),
    //           ))),
    // );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: _noteWidget(),
          ),
        ],
      ),
    );
  }

  Widget _selectTimer() {
    // return HeatingWidget(timerWork: (timerWork != null && timerWork != '') ? timerWork : '1');

    if (isTimer) {
      if (timerType == 'amrap') {
        return TimerWidget(timerWork: timerWork);
      } else if (timerType == 'tabata') {
        return RoundWidget(
            timerWork: timerWork,
            timerRound: timerRound,
            timerRest:
                (timerRest != null && timerRest != '') ? timerRest : '0');
      } else if (timerType == 'extra') {
        return ExtraWidget(timerWork: timerWork);
      } else if (timerType == 'calentamiento') {
        return HeatingWidget(
            timerWork:
                (timerWork != null && timerWork != '') ? timerWork : '30');
      } else {
        return IncreaseWidget(timerWork: timerWork);
      }
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    int contentLen = workoutItem['content'].length;
    return Scaffold(
        body: Container(
      height: height,
      decoration: BoxDecoration(color: Color(0xffFFFFFF)),
      child: Stack(
        children: <Widget>[
          Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 80),
                  _selectTimer(),
                  _tabBar(),
                  SizedBox(height: 10),
                  contentLen == 0 ? Container() : _buttonGroup(),
                ],
              ),
            ),
          ),
          Positioned(top: 30, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
