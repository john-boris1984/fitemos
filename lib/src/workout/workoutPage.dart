import 'dart:async';
import 'package:fitemos/src/utils/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:fitemos/src/workout/workoutSubCounter.dart';
import 'package:fitemos/src/workout/multiNotePage.dart';
import 'package:localstorage/localstorage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fitemos/src/widget/increaseWidget.dart';
import 'package:fitemos/src/widget/roundWidget.dart';
import 'package:fitemos/src/widget/timerWidget.dart';
import 'package:fitemos/src/widget/extraWidget.dart';
import 'package:fitemos/src/widget/heatingWidget.dart';
import 'package:fitemos/src/workout/surveyPage.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:fitemos/src/utils/apiDataSource.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:page_transition/page_transition.dart';

class WorkoutPage extends StatefulWidget {
  WorkoutPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _workoutState createState() => _workoutState();
}

class _workoutState extends State<WorkoutPage> {
  RestDatasource api = new RestDatasource();
  final LocalStorage storage = new LocalStorage('fitemos_store');
  String userName;
  String avatarImg = 'https://fitemos.com/storage/media/avatar/X-man-small.jpg';
  String workoutDate;
  String workoutImg = '';
  String currentDate;
  bool isBlog = false;
  String buttonLabel = 'Comenzar';
  dynamic workoutContent;
  Color checkColor = Colors.grey;

  String prevDate = '';
  String nextDate = '';
  bool disablePrev = false;
  bool disableNext = false;
  dynamic workoutParams;

  bool isTimer = false;
  String timerType = '';
  String timerWork = '';
  String timerRound = '';
  String timerRest = '';
  bool loadingFlag = true;
  bool opacityFlag = true;
  String tagLine = '';

  //

  _getWorkout(String date) async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api.getWorkout(date, accessToken).then((Workout workout) {
      dynamic firstBlock = workout.workoutData['workouts'];

      setState(() {
        tagLine = workout.workoutData['tagLine'];
        workoutParams = workout.workoutData['workouts']['current'];
        if (firstBlock['previous'] != null) {
          prevDate = firstBlock['previous']['today'];
          disablePrev = false;
        } else {
          prevDate = '';
          disablePrev = true;
        }
        if (firstBlock['next'] != null) {
          disableNext = false;
          nextDate = firstBlock['next']['today'];
        } else {
          nextDate = '';
          disableNext = true;
        }
        if (firstBlock['current'] != null) {
          workoutDate = firstBlock['current']['short_date'];
          if (firstBlock['current']['blocks'].length > 0) {
            workoutImg = firstBlock['current']['blocks'][0]['image_path'];
            if (firstBlock['current']['blocks'][0]['content'] != null)
              workoutContent = firstBlock['current']['blocks'][0]['content'];
            else
              workoutContent = null;

            if (firstBlock['current']['blocks'][0]['timer_type'] != null) {
              isTimer = true;
              timerType =
                  firstBlock['current']['blocks'][0]['timer_type'].toString();
              timerWork =
                  firstBlock['current']['blocks'][0]['timer_work'].toString();
              timerRound =
                  firstBlock['current']['blocks'][0]['timer_round'].toString();
              timerRest = firstBlock['current']['blocks'][0]['timer_rest'];
            } else {
              isTimer = false;
            }
          }
          // workoutImg = firstBlock['current']['blocks'][0]['image_path'];
          // if(firstBlock['current']['blocks'][0]['content'] != null)
          //   workoutContent = firstBlock['current']['blocks'][0]['content'];
          // else workoutContent = null;
          currentDate = firstBlock['current']['today'];
          if (firstBlock['current']['blog'] == true) {
            buttonLabel = 'Completar';
            isBlog = true;
          } else {
            buttonLabel = 'Comenzar';
            isBlog = false;
          }
          if (firstBlock['current']['read'] == true)
            checkColor = Colors.green;
          else
            checkColor = Colors.grey;

          // if(firstBlock['current']['blocks'][0]['timer_type'] != null){
          //   isTimer = true;
          //   timerType = firstBlock['current']['blocks'][0]['timer_type'].toString();
          //   timerWork = firstBlock['current']['blocks'][0]['timer_work'].toString();
          //   timerRound = firstBlock['current']['blocks'][0]['timer_round'].toString();
          //   timerRest = firstBlock['current']['blocks'][0]['timer_rest'];
          // }else{
          //   isTimer= false;
          // }
          opacityFlag = false;
        } else {
          currentDate = '';
        }
      });
      Future.delayed(const Duration(milliseconds: 601), () {
        setState(() {
          loadingFlag = false;
        });
      });
    }).catchError((error) {});
  }

  _setCheck(String date) async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api.setCheck(date, isBlog, accessToken).then((CheckVal returnVal) {
      print(returnVal.returnData['fromWorkout']);
    }).catchError((error) {
      print(error);
    });
  }

  String _getBeforeDay(String flag) {
    List<String> dateList = currentDate.split('-');
    int year = int.parse(dateList[0]);
    int month = int.parse(dateList[1]);
    int day = int.parse(dateList[2]);
    var date;
    if (flag == 'before') {
      date = new DateTime(year, month, day - 1);
    } else {
      date = new DateTime(year, month, day + 1);
    }
    return '${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  _getSurvey() async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api.getSurvey(accessToken).then((Account returnVal) {
      setState(() {
        if (returnVal.returnData['survey'] != null) {
          Navigator.push(
              context,
              // PageTransition(
              //     type: PageTransitionType.rightToLeft, //leftToRight,
              //     child: Survey(params: returnVal.returnData['survey']))
              MaterialPageRoute(
                      builder: (context) => Survey(params: returnVal.returnData['survey']))
              
          );
        }
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  void initState() {
    super.initState();
    // userName = storage.getItem('accessToken')['user']['name'];
    // if (storage.getItem('accessToken')['user']['avatar'] != null) {
    //   avatarImg = storage.getItem('accessToken')['user']['avatarUrls']['small'];
    // }

    userName = SessionManager.getUserName();
    if (SessionManager.getAvatar() != '')
      avatarImg = SessionManager.getAvatar();

    _getWorkout('');
    _getSurvey();
  }

  Widget _showLoading() {
    return AnimatedOpacity(
      opacity: opacityFlag ? 1 : 0,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 200),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SpinKitRipple(
          color: Color(0xff1A7998),
          size: 120.0,
        ),
      ),
    );
  }

  Widget _headerInfo() {
    return InkWell(
        child: Container(
      height: 190,
      padding: EdgeInsets.only(top: 60),
      decoration: BoxDecoration(color: Color(0xffE5E5E5)),
      child: Stack(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),

                  // child: Container(
                  //   height: 52,
                  //   width: 52,
                  //   //width: MediaQuery.of(context).size.width,
                  //   decoration: BoxDecoration(
                  //     //borderRadius: BorderRadius.all(Radius.circular(5)),
                  //     border: Border.all(
                  //         color: Colors.grey.withOpacity(0.9),
                  //         width: 0.7,
                  //         style: BorderStyle.solid),
                  //     image: DecorationImage(
                  //       fit: BoxFit.fill,
                  //       image: NetworkImage(avatarImg),
                  //     ),
                  //   ),
                  // )
                  child: Image.network(
                    avatarImg,
                    width: 52,
                    height: 52,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                            text: 'Hola $userName',
                            style: GoogleFonts.rubik(
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff333333)))),
                    RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                            text: tagLine,
                            style: GoogleFonts.rubik(
                                fontSize: 12, color: Color(0xff333333))))
                  ],
                ),
              ),
            ],
          ),
          Positioned(bottom: 0, left: 0, child: _headerSchedule()),
        ],
      ),
    ));
  }

  Widget _scheduleButtonleft() {
    return InkWell(
      child: IconButton(
        iconSize: 16.0,
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.black,
        onPressed: () {
          if (prevDate != '') _getWorkout(prevDate);
        },
      ),
    );
  }

  Widget _scheduleDateLabel() {
    return InkWell(
        child: Padding(
      padding: EdgeInsets.only(top: 16, left: 20),
      child: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
              text: workoutDate,
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)))),
    ));
  }

  Widget _scheduleButtonright() {
    return InkWell(
      child: IconButton(
        iconSize: 16.0,
        icon: Icon(Icons.arrow_forward_ios),
        color: Colors.black,
        onPressed: () {
          if (nextDate != '') _getWorkout(nextDate);
        },
      ),
    );
  }

  Widget _completeState() {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: checkColor),
      child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.check,
            size: 15.0,
            color: Colors.white,
          )),
    );
  }

  Widget _headerSchedule() {
    return InkWell(
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25), 
                  topLeft: Radius.circular(25)),
              color: Color(0xfffafafa),
            ),
            child: Stack(children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  disablePrev ? Container() : _scheduleButtonleft(),
                  _scheduleDateLabel(),
                  disableNext ? Container() : _scheduleButtonright(),
                ],
              ),
              Positioned(top: 12, right: 20, child: _completeState()),
            ])));
  }

  Widget _start() {
    return InkWell(
        onTap: () async {
          if (workoutContent != null) {
            if (isBlog != true) {
              if (workoutParams['blocks'].length > 1) {
                var result = await Navigator.push(
                    context,
                    // PageTransition(
                    //     type: PageTransitionType.rightToLeft, //leftToRight,
                    //     child: WorkoutSubCounter(params: workoutParams))
                    MaterialPageRoute(
                      builder: (context) => WorkoutSubCounter(params: workoutParams))
                );
                if (result) {
                  if (checkColor == Colors.grey) {
                    setState(() {
                      checkColor = Colors.green;
                    });
                    _setCheck(currentDate);
                  }
                }
              }
            } else {
              setState(() {
                checkColor = Colors.green;
              });
              _setCheck(currentDate);
            }
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Color(0xff1A7998)),
          child: Text(
            buttonLabel,
            style: GoogleFonts.rubik(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color(0xffFFFFFF)),
          ),
        ));
  }

  Widget _workout() {
    return InkWell(
        onTap: () async {
          if (workoutContent != null) {
            if (isBlog != true) {
              var result = await Navigator.push(
                  context,
                  // PageTransition(
                  //     type: PageTransitionType.rightToLeft, //leftToRight,
                  //     child: MultiNote(params: workoutParams))
                  MaterialPageRoute(
                      builder: (context) => MultiNote(params: workoutParams))
              );
              if (result) {
                var result = await Navigator.push(
                    context,
                    // PageTransition(
                    //     type: PageTransitionType.rightToLeft, //leftToRight,
                    //     child: WorkoutSubCounter(params: workoutParams))
                    MaterialPageRoute(
                      builder: (context) => WorkoutSubCounter(params: workoutParams))
                );
                if (result) {
                  if (checkColor == Colors.grey) {
                    setState(() {
                      checkColor = Colors.green;
                    });
                    _setCheck(currentDate);
                  }
                }
              }
            } else {
              setState(() {
                checkColor = Colors.green;
              });
              _setCheck(currentDate);
            }
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              border: Border.all(
                  color: Color(0xff333333),
                  width: 1.0,
                  style: BorderStyle.solid),
              color: Colors.transparent),
          child: Text(
            'Ver Workout',
            style: GoogleFonts.rubik(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color(0xff333333)),
          ),
        ));
  }

  Widget _buttonGroup() {
    return InkWell(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          isBlog
              ? Container()
              : Padding(padding: EdgeInsets.only(right: 10), child: _workout()),
          isBlog
              ? checkColor == Colors.green
                  ? Container()
                  : Padding(padding: EdgeInsets.only(left: 10), child: _start())
              : Padding(padding: EdgeInsets.only(left: 10), child: _start()),
        ],
      ),
    ));
  }

  Widget _workoutImg() {
    if (workoutImg != null || workoutImg != '') {
      return
          // Container(
          //   height: 230,
          //   width: MediaQuery.of(context).size.width,
          //   decoration: BoxDecoration(
          //     //borderRadius: BorderRadius.all(Radius.circular(5)),
          //     border: Border.all(
          //         color: Colors.grey.withOpacity(0.9),
          //         width: 0.7,
          //         style: BorderStyle.solid),
          //     image: DecorationImage(
          //       fit: BoxFit.fill,
          //       image: NetworkImage(workoutImg),
          //     ),
          //   ),
          // )
          Container(
              child: Image.network(
        workoutImg,
        fit: BoxFit.cover,
        width: double.maxFinite,
      ));
    } else {
      return Container();
    }
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
    // String str = item['before_content'];

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
        margin: EdgeInsets.only(top: 5),
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
                : Container(width: 0),
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
    if (workoutContent != null) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(workoutContent.length, (int index) {
            //String str = workoutContent[index]['before_content'] + ' ';
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _itemContent(workoutContent[index]),
                ],
              ),
            );
          }),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _selectTimer() {
    // return HeatingWidget(
    //     timerWork: (timerWork != null && timerWork != '') ? timerWork : '1');

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
        HeatingWidget(
            timerWork:
                (timerWork != null && timerWork != '') ? timerWork : '30');
      } else {
        return IncreaseWidget(timerWork: timerWork);
      }
    } else {
      return Container();
    }
  }

  Widget _showSubActiveAlert() {
    return Padding(
        padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Tu suscripción de entrenamiento está inactiva.',
                style: GoogleFonts.rubik(
                  fontSize: 18,
                  //fontWeight: FontWeight.w800,
                  color: Colors.red,
                ))));
  }

  Widget _bodySchedule() {
    return InkWell(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            isBlog != true ? _workoutImg() : _selectTimer(),
            SizedBox(height: 10),
            _workoutWidget(),
            SizedBox(height: 30),
            _buttonGroup()
            // SessionManager.getSubscriptionActiveFlag()
            // ? _buttonGroup()
            // : _showSubActiveAlert(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      decoration: BoxDecoration(color: Color(0xffE5E5E5)),
      child: Stack(
        children: <Widget>[
          Container(child: LayoutBuilder(builder: (context, constraint) {
            return SingleChildScrollView(
                child: Container(
                    color: Colors.white,
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraint.maxHeight,
                        ),
                        child: IntrinsicHeight(
                            child: Column(children: <Widget>[
                          _headerInfo(),
                          _bodySchedule()
                        ])))));
          })),
          Positioned(
              left: 0,
              top: 0,
              child: loadingFlag ? _showLoading() : Container()),
        ],
      ),
    ));
  }
}
