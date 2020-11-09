import 'package:flutter/material.dart';
import 'package:fitemos/src/account/supportDetailPage.dart';
import 'package:fitemos/src/account/legalTermsPage.dart';
import 'package:fitemos/src/account/legalPrivacyPage.dart';
import 'package:fitemos/src/account/legalCookiesPage.dart';
import 'package:fitemos/src/account/contactPage.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:page_transition/page_transition.dart';
import 'package:fitemos/src/page_transition.dart';

class Support extends StatefulWidget {
  Support({Key key}) : super(key: key);

  @override
  _supportState createState() => _supportState();
}

class _supportState extends State<Support> {
  String contentTitle1 = "Preguntas frecuentes";
  String legalTitle1 = "Términos de Uso";
  String legalTitle2 = "Política de Privacidad";
  String legalTitle3 = "Uso de Cookies";

  Widget _backButton() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      height: 90,
      child: Row(
        children: <Widget>[
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(left: 15, top: 12, bottom: 10),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              )),
          Container(
              padding: EdgeInsets.only(left: 6, top: 11, bottom: 10),
              child: Text('Soporte',
                  style: GoogleFonts.rubik(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333333)))),
        ],
      ),
    );
  }

  Widget _bodyHelp() {
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text("Temas de Ayuda",
                  style: GoogleFonts.rubik(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333333))),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("Preguntas frecuentes",
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff333333))),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey.shade400,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft, //leftToRight,
                        child: SupportDetail(conTitle: contentTitle1)));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyLegal() {
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text("Legal",
                  style: GoogleFonts.rubik(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333333))),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("Términos de Uso",
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff333333))),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey.shade400,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft, //leftToRight,
                        child: LegalTerms(conTitle: legalTitle1)));
              },
            ),
            ListTile(
              title: Text("Política de Privacidad",
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff333333))),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey.shade400,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.leftToRight,
                        child: LegalPrivacy(conTitle: legalTitle2)));
              },
            ),
            ListTile(
              title: Text("Uso de Cookies",
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff333333))),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey.shade400,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft, //leftToRight,
                        child: LegalCookie(conTitle: legalTitle3)));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyForm() {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("¿Aún Necesitas Ayuda?",
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff333333))),
          SizedBox(height: 10),
          Container(
              width: MediaQuery.of(context).size.width / 2.3,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FlatButton(
                color: Color(0xff1A7998),
                textColor: Colors.white,
                padding: EdgeInsets.all(3.0),
                splashColor: Colors.cyan,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0)),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft, //leftToRight,
                          child: Contact()));
                },
                child: Text(
                  "Contáctenos",
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
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
                  SizedBox(height: 100),
                  _bodyHelp(),
                  SizedBox(height: 30),
                  _bodyLegal(),
                  SizedBox(height: 30),
                  _bodyForm(),
                ],
              ),
            ),
          ),
          Positioned(top: 0, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
