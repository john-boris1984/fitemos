import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fitemos/src/auth/loginPage.dart';
import 'package:fitemos/src/auth/checkEmailPage.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:fitemos/src/utils/apiDataSource.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:page_transition/page_transition.dart';

class ForgotFassword extends StatefulWidget {
  ForgotFassword({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _forgotPasswordState createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<ForgotFassword> {
  RestDatasource api = new RestDatasource();
  bool errorMessage = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _email;

  doReset(String username) async {
    api.resetPassword(username).then((ResetPassword data) {
      if (data.returnData) {
        Navigator.push(
            context,
            // PageTransition(
            //     type: PageTransitionType.rightToLeft, //leftToRight,
            //     child: LoginPage(
            //       resetPwdFlag: true,
            //     ))
            MaterialPageRoute(
                builder: (context) => LoginPage(
                  resetPwdFlag: true,
                ))
        );
      }
    }).catchError((error) {
      setState(() {
        errorMessage = true;
      });
      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          errorMessage = false;
        });
      });
    });
    // Navigator.push(
    //         context,
    //         PageTransition(
    //             type: PageTransitionType.leftToRight, child: LoginPage(resetPwdFlag: true,)));
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      doReset(_email);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  Widget _sendButton() {
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
            'Enviar',
            style: GoogleFonts.rubik(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color(0xffFFFFFF)),
          ),
        ));
  }

  Widget _backToLogin() {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              // PageTransition(
              //     type: PageTransitionType.leftToRight, child: LoginPage())
              MaterialPageRoute(
                builder: (context) => LoginPage())
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              border: Border.all(
                  color: Colors.white, width: 1.0, style: BorderStyle.solid),
              color: Colors.transparent),
          child: Text(
            'Iniciar Sesión',
            style: GoogleFonts.rubik(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color(0xffFFFFFF)),
          ),
        ));
  }

  Widget _forgotPassTitle() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: '¿Contraseña olvidada?',
                style: GoogleFonts.rubik(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffffff)))));
  }

  Widget _forgotPassDisc() {
    final width = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: width / 6),
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text:
                    'Ingrese su correo electrónico registrado para recibir instrucciones.',
                style: GoogleFonts.rubik(
                    fontSize: 14, color: Color(0xffffffff)))));
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Inválido correo';
    else
      return null;
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
                            'No podemos encontrar su correo electrónico, verifíquelo.',
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
        ),
        new SizedBox(
          height: 20.0,
        ),
      ],
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
                  SizedBox(height: height * .13),
                  _forgotPassTitle(),
                  SizedBox(height: height * .02),
                  _forgotPassDisc(),
                  SizedBox(height: height * .12),
                  Form(
                    key: _formKey,
                    autovalidate: _autoValidate,
                    child: formUI(),
                  ),
                  _showErrorMessage(),
                  SizedBox(height: height * .25),
                  _sendButton(),
                  SizedBox(height: height * .02),
                  _backToLogin(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
