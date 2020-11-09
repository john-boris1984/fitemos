import 'package:flutter/material.dart';
import 'package:fitemos/src/auth/loginPage.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:page_transition/page_transition.dart';

class NewPassword extends StatefulWidget {
  NewPassword({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _newPasswordState createState() => _newPasswordState();
}

class _newPasswordState extends State<NewPassword> {
  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xffFFFFFF)),
          ),
          SizedBox(
            height: 1,
          ),
          TextField(
              obscureText: isPassword,
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFFFFFF)),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffDDDDD7), width: 1.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffFFFFFF), width: 1.0))))
        ],
      ),
    );
  }

  Widget _createButton() {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              // PageTransition(
              //     type: PageTransitionType.rightToLeft, //leftToRight,
              //     child: LoginPage())
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
              color: Color(0xffAFCA32)),
          child: Text(
            'Create',
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
                text: 'Create new password',
                style: GoogleFonts.rubik(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffffff)))));
  }

  Widget _forgotPassDisc() {
    final width = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: width / 8),
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text:
                    'Your new password must be different from previously used passwords',
                style: GoogleFonts.rubik(
                    fontSize: 14, color: Color(0xffffffff)))));
  }

  Widget _emailWidget() {
    return Column(
      children: <Widget>[
        _entryField("New Password", isPassword: true),
        _entryField("Confirm Password", isPassword: true)
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
                  _emailWidget(),
                  SizedBox(height: height * .18),
                  _createButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
