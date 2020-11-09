import 'dart:async';
//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:fitemos/src/utils/session_manager.dart';
import 'package:fitemos/src/widget/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:fitemos/src/FitemosPage.dart';
import 'package:fitemos/src/auth/forgotPasswordPage.dart';
import 'package:fitemos/src/auth/facebook_webview.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:fitemos/src/utils/apiDataSource.dart';
// import 'package:page_transition/page_transition.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final String clientId = '660886487983366';
final String redirectUrl =
    'https://fitemos-f2ff0.firebaseapp.com/__/auth/handler';

class LoginPage extends StatefulWidget {
  final bool resetPwdFlag;
  LoginPage({Key key, this.resetPwdFlag = false}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  RestDatasource api = new RestDatasource();
  bool errorMessage = false;
  bool activeFlag = true;
  bool subscriptionActiveFlag = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _email;
  String _password;
  final fb.FirebaseAuth firebaseAuth = fb.FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool loadingFlag = false;
  bool opacityFlag = false;

  Widget _showLoading() {
    return AnimatedOpacity(
      opacity: opacityFlag ? 0.3 : 0,
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

  Future<String> loginWithFacebook() async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FacebookWebView(
          url:
              'https://www.facebook.com/dialog/oauth?client_id=$clientId&redirect_uri=$redirectUrl&response_type=token&scope=email,public_profile,',
        ),
        maintainState: true,
      ),
    );
    
    if(result == null || result == '' ) return null; 
    
    api.loginWithFacebook(result).then((User user) {
      
      if(user == null) return null;
      SessionManager.setLogIn(true);
      SessionManager.rememberMe(true);
      SessionManager.setUserID(user.id);
      SessionManager.setUserName(user.username);
      SessionManager.setToken(user.accessToken);
      SessionManager.setEmail(user.email);
      SessionManager.setSubscriptionActiveFlag(user.subscriptionActive);
      SessionManager.setAvatar(user.avatarImg);

      Future.delayed(const Duration(milliseconds: 601), () {
        setState(() {
          loadingFlag = false;
        });
        Navigator.push(
            context,
            // PageTransition(
            //     type: PageTransitionType.rightToLeft, //leftToRight,
            //     child: FitnessNav())
            MaterialPageRoute(
                builder: (context) => FitnessNav())
        );
      });  
    });
    // print(result);
    // if (result != null) {
    //   try {
    //     final facebookAuthCred = fb.FacebookAuthProvider.credential(result);
    //     final user = await firebaseAuth.signInWithCredential(facebookAuthCred);
    //     print(user);
    //     if (user != null) {
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => FitnessNav(),
    //         ),
    //       );
    //     }
    //   } catch (e) {
    //     print(e);
    //   }
    // }
  }

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    // final fb.AuthCredential credential = fb.GoogleAuthProvider.credential(
    //   accessToken: googleSignInAuthentication.accessToken,
    //   idToken: googleSignInAuthentication.idToken,
    // );

    // final fb.UserCredential authResult =
    //     await firebaseAuth.signInWithCredential(credential);
    // final fb.User user = authResult.user;

    // if (user != null) {
    //   assert(!user.isAnonymous);
    //   assert(await user.getIdToken() != null);

    //   final fb.User currentUser = firebaseAuth.currentUser;
    //   assert(user.uid == currentUser.uid);

    //   print('signInWithGoogle succeeded: $user');

    //   return '$user';
    // }
    api.loginWithGoogle(googleSignInAuthentication.idToken).then((User user) {
      
      if(user == null) return null;
      SessionManager.setLogIn(true);
      SessionManager.rememberMe(true);
      SessionManager.setUserID(user.id);
      SessionManager.setUserName(user.username);
      SessionManager.setToken(user.accessToken);
      SessionManager.setEmail(user.email);
      SessionManager.setSubscriptionActiveFlag(user.subscriptionActive);
      SessionManager.setAvatar(user.avatarImg);

      Future.delayed(const Duration(milliseconds: 601), () {
        setState(() {
          loadingFlag = false;
        });
        Navigator.push(
            context,
            // PageTransition(
            //     type: PageTransitionType.rightToLeft, //leftToRight,
            //     child: FitnessNav())
            MaterialPageRoute(
                builder: (context) => FitnessNav())
        );
      });  
    });
    return null;
  }

  Future<Null> _loginGoogle() async {

     signInWithGoogle();
  }

  Future<Null> _loginFacebook() async {
    loginWithFacebook();
  }

  doLogin(String username, String password) async {
    api.login(username, password).then((User user) {
      if (user.active == 0) {
        setState(() {
          activeFlag = false;
          loadingFlag = false;
        });
      }
      // else if (user.subscriptionActive == false) {
      //   setState(() {
      //     subscriptionActiveFlag = false;
      //     loadingFlag = false;
      //   });
      // }
      else {
        SessionManager.setLogIn(true);
        SessionManager.rememberMe(true);
        SessionManager.setUserID(user.id);
        SessionManager.setUserName(user.username);
        SessionManager.setToken(user.accessToken);
        SessionManager.setEmail(user.email);
        SessionManager.setSubscriptionActiveFlag(user.subscriptionActive);
        SessionManager.setAvatar(user.avatarImg);

        Future.delayed(const Duration(milliseconds: 601), () {
          setState(() {
            loadingFlag = false;
          });
          Navigator.push(
              context,
              // PageTransition(
              //     type: PageTransitionType.rightToLeft, //leftToRight,
              //     child: FitnessNav())
              MaterialPageRoute(
                builder: (context) => FitnessNav())
          );
        });
      }
    }).catchError((error) {
      setState(() {
        errorMessage = true;
        loadingFlag = false;
      });
      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          errorMessage = false;
          loadingFlag = false;
        });
      });
    });
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        loadingFlag = true;
        opacityFlag = true;
      });
      doLogin(_email, _password);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  String validatePassword(String value) {
    if (value.length < 1)
      return 'Ingrese una contraseña';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Verifique su email';
    else
      return null;
  }

  Widget _loginButton() {
    return InkWell(
        onTap: () {
          _validateInputs();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Color(0xffAFCA32)),
          child: Text(
            'Inicia Sesión',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ));
  }

  Widget _splashIcon() {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        padding: EdgeInsets.symmetric(vertical: 0),
        alignment: Alignment.center,
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }

  Widget _forgotPassword() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            // PageTransition(
            //     type: PageTransitionType.rightToLeft, //leftToRight,
            //     child: ForgotFassword())
            MaterialPageRoute(
                builder: (context) => ForgotFassword())
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.centerRight,
        child: Text(
          '¿Olvidaste tu contraseña?',
          style: GoogleFonts.rubik(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Color(0xffAFCA32)),
        ),
      ),
    );
  }

  Widget _forgotPassword1() {
    return Padding(
        padding: EdgeInsets.only(left: 130),
        child: CustomBtn(
          onPressed: () {
            Navigator.push(
                context,
                // PageTransition(
                //     type: PageTransitionType.rightToLeft, // leftToRight,
                //     child: ForgotFassword())
                MaterialPageRoute(
                builder: (context) => ForgotFassword())
            );
          },
          height: 25,
          text: '¿Olvidaste tu contraseña?',
          fontSize: 12,
          fontColor: Color(0xffAFCA32),
          fontAlignment: Alignment.centerRight,
          backColor: Colors.transparent,
        ));
  }

  Widget _showResetPwdMessage() {
    return Padding(
        padding: EdgeInsets.only(top: 8),
        child: Text(
          'Recibirás una contraseña temporal a tu correo electrónico',
          style: GoogleFonts.rubik(
              fontSize: 12, fontWeight: FontWeight.normal, color: Colors.blue),
        ));
  }

  Widget _showActiveState() {
    if (!activeFlag) {
      return Padding(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Tu membresía está inactiva.',
                  style: GoogleFonts.rubik(
                    fontSize: 18,
                    //fontWeight: FontWeight.w800,
                    color: Colors.red,
                  ))));
    } else if (!subscriptionActiveFlag) {
      return Padding(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Tu suscripción de entrenamiento está inactiva.',
                  style: GoogleFonts.rubik(
                    fontSize: 18,
                    //fontWeight: FontWeight.w800,
                    color: Colors.red,
                  ))));
    } else {
      return Container();
    }
  }

  Widget _showErrorMessage() {
    return Visibility(
      visible: errorMessage,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Color(0xffd8330e),
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 100,
                child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                        text:
                            'El correo electrónico o la contraseña son incorrectos, intente nuevamente.',
                        style: GoogleFonts.rubik(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffffffff),
                        ))),
              ),
              Container(
                width: 30,
                child: IconButton(
                  iconSize: 20.0,
                  padding: EdgeInsets.all(0.0),
                  icon: Icon(Icons.close),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      errorMessage = false;
                    });
                  },
                ),
              ),
            ]),
      ),
    );
  }

  Widget _loginTitle() {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'Inicia Sesión',
            style: GoogleFonts.rubik(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: Color(0xffffffff),
            )));
  }

  Widget formUI() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Correo',
          style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xffFFFFFF).withOpacity(.7)),
        ),
        new TextFormField(
          keyboardType: TextInputType.emailAddress,
          style: GoogleFonts.rubik(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xffFFFFFF)),
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffDDDDD7), width: 1.0)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xffFFFFFF).withOpacity(.5), width: 1.0))),
          validator: validateEmail,
          onSaved: (String val) {
            _email = val;
          },
          onChanged: (value) {
            setState(() {
              activeFlag = true;
              subscriptionActiveFlag = true;
            });
          },
        ),
        new SizedBox(
          height: 20.0,
        ),
        Text(
          'Contraseña',
          style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xffFFFFFF).withOpacity(.7)),
        ),
        new TextFormField(
          obscureText: true,
          style: GoogleFonts.rubik(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xffFFFFFF)),
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffffffff), width: 1.0)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xffFFFFFF).withOpacity(.5), width: 1.0))),
          keyboardType: TextInputType.text,
          validator: validatePassword,
          onSaved: (String val) {
            _password = val;
          },
          onChanged: (value) {
            setState(() {
              activeFlag = true;
              subscriptionActiveFlag = true;
            });
          },
        ),
        new SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  Widget _socialButtons() {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width / 4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {
              _loginFacebook();
            },
            child: Container(
              width: 35.0,
              height: 35.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.blue)),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.facebookF,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          InkWell(
              onTap: () {
                _loginGoogle();
              },
              child: Container(
                width: 35.0,
                height: 35.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.red)),
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.google,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      decoration: BoxDecoration(color: Color(0xff333333)),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .15),
                  _splashIcon(),
                  SizedBox(height: 30),
                  _loginTitle(),
                  SizedBox(height: 20),
                  _showActiveState(),
                  Form(
                    key: _formKey,
                    autovalidate: _autoValidate,
                    child: formUI(),
                  ),
                  _showErrorMessage(),
                  _forgotPassword1(),
                  widget.resetPwdFlag
                      ? _showResetPwdMessage()
                      : Container(), //_forgotPassword(),
                  SizedBox(height: 20),
                  _loginButton(),
                  SizedBox(height: 40),
                  _socialButtons(),
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
