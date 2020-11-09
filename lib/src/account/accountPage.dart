import 'dart:async';
import 'package:fitemos/src/account/notificationSetting.dart';
import 'package:fitemos/src/auth/loginPage.dart';
import 'package:fitemos/src/utils/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:fitemos/src/account/profilePage.dart';
import 'package:fitemos/src/account/configurePage.dart';
import 'package:fitemos/src/account/supportPage.dart';
import 'package:fitemos/src/account/shareFitness.dart';
import 'package:fitemos/src/account/billPage.dart';
import 'package:fitemos/src/account/rateApp.dart';
import 'package:fitemos/src/utils/apiDataSource.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:localstorage/localstorage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitemos/src/page_transition.dart';
//import 'package:page_transition/page_transition.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _accountState createState() => _accountState();
}

class _accountState extends State<AccountPage> {
  RestDatasource api = new RestDatasource();
  final LocalStorage storage = new LocalStorage('fitemos_store');
  dynamic userInfo;
  dynamic workoutData;
  dynamic userData;
  dynamic historyData;
  String toWorkout = '';
  String workoutCount = '';
  String combineVal = '';
  double progressVal = 0.0;
  String avatarImg = 'https://fitemos.com/storage/media/avatar/X-man-small.jpg';
  bool loadingFlag = true;
  bool opacityFlag = true;
  double xWidth = 0.0;

  _getReferral() async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api.getReferral(accessToken).then((Account referral) {
      Navigator.push(
          context,
          PageTransition(
              //type: PageTransitionType.leftToRight,
              type: PageTransitionType.rightToLeft,
              child: ShareFitness(params: referral.returnData)));
    }).catchError((error) {});
  }

  _getHistory() async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api.getHistory(accessToken).then((Account history) {
      setState(() {
        historyData = history.returnData;
        opacityFlag = false;
      });
      Future.delayed(const Duration(milliseconds: 601), () {
        setState(() {
          loadingFlag = false;
        });
      });
    }).catchError((error) {});
  }

  _getRecentWorkout() async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api.getProfileWorkout(accessToken).then((Account workout) {
      setState(() {
        workoutData = workout.returnData['profile'];
        workoutCount = workout.returnData['profile']['workoutCount'].toString();
        toWorkout = workout.returnData['profile']['toWorkout'].toString();
        combineVal = workoutCount + '/' + toWorkout;
        progressVal = 1 / double.parse(toWorkout) * double.parse(workoutCount);
      });
      _getHistory();
    }).catchError((error) {});
  }

  void updateState() {
    setState(() {
      dynamic user = storage.getItem('accessToken')['user'];
      userData = user;
      if (user != null) {
        userInfo = user;
      }
      if (user['avatar'] != null) {
        avatarImg = user['avatarUrls']['medium'];
      }
      _getRecentWorkout();
    });
  }

  @override
  void initState() {
    super.initState();
    
    if (SessionManager.getAvatar() != '')
      avatarImg = SessionManager.getAvatar();

    updateState();
  }

  Widget _showLoading() {
    return AnimatedOpacity(
      opacity: opacityFlag ? 1 : 0,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 600),
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
    final double _width = MediaQuery.of(context).size.width - 100;
    return InkWell(
      onTap: () {},
      child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: Image.network(
                  avatarImg,
                  width: 52,
                  height: 52,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                  width: _width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${userInfo['customer']['first_name']} ${userInfo['customer']['last_name']}',
                            style: GoogleFonts.rubik(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff333333)),
                          ),
                          const Spacer(), //SizedBox(width: 64,),
                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 7),
                                  child: Text(
                                    workoutCount,
                                    style: TextStyle(fontSize: 12),
                                    textAlign: TextAlign.start,
                                  )),
                              Text(
                                '/',
                                style: TextStyle(fontSize: 20),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 7),
                                  child: Text(
                                    toWorkout,
                                    style: TextStyle(fontSize: 12),
                                    textAlign: TextAlign.end,
                                  ))
                            ],
                          ),
                        ],
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 8, 0, 8),
                          width: double.maxFinite,
                          height: 30,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                            backgroundColor: Color(0xffD4ED6F).withOpacity(0.4),
                            value: progressVal,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xffAFCA32)),
                          )
                        )
                      )
                    ],
                  )),
            ],
          )),
    );

    // final width = MediaQuery.of(context).size.width - 40;
    // return InkWell(
    //     child: Container(
    //   padding: EdgeInsets.symmetric(horizontal: 20),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: <Widget>[
    //       Container(
    //         child: ClipRRect(
    //           borderRadius: BorderRadius.all(Radius.circular(50)),
    //           child: Image.network(
    //             avatarImg,
    //             width: 52,
    //             height: 52,
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: EdgeInsets.only(left: 20, right: 0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: <Widget>[
    //             // Container(
    //             //   width: width,// - 150,
    //             //   child:
    //             Row(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: <Widget>[
    //                   RichText(
    //                       textAlign: TextAlign.center,
    //                       text: TextSpan(
    //                           text:
    //                               '${userInfo['customer']['first_name']} ${userInfo['customer']['last_name']}',
    //                           style: GoogleFonts.rubik(
    //                               fontSize: 21,
    //                               fontWeight: FontWeight.bold,
    //                               color: Color(0xff333333)))),
    //                   const Spacer(),
    //                   RichText(
    //                       textAlign: TextAlign.center,
    //                       text: TextSpan(
    //                           text: combineVal,
    //                           style: GoogleFonts.rubik(
    //                               fontSize: 14,
    //                               fontWeight: FontWeight.normal,
    //                               color: Color(0xff333333)))),
    //                 ]),
    //             //),
    //             Container(
    //               width: width - 150,
    //               padding: EdgeInsets.only(top: 10),
    //               child: SizedBox(
    //                 height: 8.0,
    //                 child: LinearProgressIndicator(
    //                   backgroundColor: Color(0xffD4ED6F).withOpacity(0.4),
    //                   value: progressVal,
    //                   valueColor:
    //                       AlwaysStoppedAnimation<Color>(Color(0xffAFCA32)),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // ));
  }

  Widget _headerAccount() {
    return InkWell(
        child: Container(
      width: MediaQuery.of(context).size.width,
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25), topLeft: Radius.circular(25)),
        color: Colors.white,
      ),
    ));
  }

  Widget _bodyAccount() {
    final height = MediaQuery.of(context).size.height;
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 10),
        color: Color(0xffFFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text("Mi Perfil",
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff333333))),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey.shade400,
              ),
              onTap: () {
                if (historyData != null)
                  Navigator.push(
                      context,
                      PageTransition(
                          //type: PageTransitionType.leftToRight,
                          type: PageTransitionType.rightToLeft,
                          child: Profile(
                              workoutData: workoutData,
                              userData: userData,
                              historyData: historyData)));
              },
            ),
            SizedBox(height: 5),
            ListTile(
              title: Text("Configuración",
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff333333))),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey.shade400,
              ),
              onTap: () async {
                var result = await Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft, //leftToRight,
                        child: Configure(userData: userData)));
                if (result) {
                  setState(() {
                    userData = storage.getItem('accessToken')['user'];
                  });
                }
              },
            ),
            SizedBox(height: 5),
            ListTile(
              title: Text("Cuenta",
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff333333))),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey.shade400,
              ),
              onTap: () async {
                var result = await Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft, //leftToRight,
                        child: BillPage()));
                print(result);
                if (result) {
                  updateState();
                }
              },
            ),
            SizedBox(height: 5),
            ListTile(
              title: Text("Invita a un amigo",
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff333333))),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey.shade400,
              ),
              onTap: () {
                _getReferral();
              },
            ),
            SizedBox(height: 5),
            ListTile(
              title: Text("Soporte",
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff333333))),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey.shade400,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft, // leftToRight,
                        child: Support()));
              },
            ),
            // SizedBox(height: 5),
            // ListTile(
            //   title: Text("Déjanos una Valoración",
            //       style: GoogleFonts.rubik(
            //           fontSize: 16,
            //           fontWeight: FontWeight.w600,
            //           color: Color(0xff333333))),
            //   trailing: Icon(
            //     Icons.keyboard_arrow_right,
            //     color: Colors.grey.shade400,
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         PageTransition(
            //             type: PageTransitionType.leftToRight,
            //             child: RateApp()));
            //   },
            // ),
            // SizedBox(height: 5),
            // ListTile(
            //   title: Text("Configuración de Notificación",
            //       style: GoogleFonts.rubik(
            //           fontSize: 16,
            //           fontWeight: FontWeight.w600,
            //           color: Color(0xff333333))),
            //   trailing: Icon(
            //     Icons.keyboard_arrow_right,
            //     color: Colors.grey.shade400,
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         PageTransition(
            //             type: PageTransitionType.leftToRight,
            //             child: NotificationSetting()));
            //   },
            // ),

            SizedBox(height: 5),
            ListTile(
              title: Text("Cerrar sesión",
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff333333))),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey.shade400,
              ),
              onTap: () {
                showAlertDialog(context, 'Cerrar sesión',
                    '¿Realmente cerrarías la sesión?');
              },
            ),

            SizedBox(height: height * 0.2774),
          ],
        ),
      ),
    );
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
        SessionManager.setLogIn(false);
        SessionManager.rememberMe(false);
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                type: PageTransitionType.leftToRight, child: LoginPage()),
            ModalRoute.withName('/'));
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      decoration: BoxDecoration(color: Color(0xffE5E5E5)),
      child: Stack(
        children: <Widget>[
          Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: height * .08),
                  _headerInfo(),
                  SizedBox(height: 30),
                  _headerAccount(),
                  _bodyAccount(),
                ],
              ),
            ),
          ),
          Positioned(
              left: 0,
              top: 0,
              child: loadingFlag ? _showLoading() : Container()),
        ],
      ),
    ));
  }
}
