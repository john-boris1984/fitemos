import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThermometerWidget extends StatelessWidget {
  Widget _thermometerLeft() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: 'Nivel Fisico 5',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333)))),
            ),
            Container(
                width: 20,
                height: 5,
                padding: EdgeInsets.only(left: 30),
                color: Color(0xff333333))
          ],
        ),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: 'Nivel Fisico 4',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333)))),
            ),
            Container(
                width: 20,
                height: 5,
                padding: EdgeInsets.only(left: 30),
                color: Color(0xff333333))
          ],
        ),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: 'Nivel Fisico 3',
                      style: GoogleFonts.rubik(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff51AB80)))),
            ),
            Container(
                width: 20,
                height: 5,
                padding: EdgeInsets.only(left: 30),
                color: Color(0xff333333))
          ],
        ),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: 'Nivel Fisico 2',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333)))),
            ),
            Container(
                width: 20,
                height: 5,
                padding: EdgeInsets.only(left: 30),
                color: Color(0xff333333))
          ],
        ),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: 'Nivel Fisico 1',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333)))),
            ),
            Container(
                width: 20,
                height: 5,
                padding: EdgeInsets.only(left: 30),
                color: Color(0xff333333))
          ],
        ),
      ],
    );
  }

  Widget _thermometerCenter() {
    var markVal = 20;
    var volume = 204 / 100 * markVal;
    return Container(
      width: 80,
      height: 210,
      margin: EdgeInsets.only(top: 30),
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
    );
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
            Container(width: 20, height: 5, color: Color(0xff333333)),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: '+100',
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
            Container(width: 20, height: 5, color: Color(0xff333333)),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: '80',
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
            Container(width: 20, height: 5, color: Color(0xff333333)),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: '60',
                      style: GoogleFonts.rubik(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff333333)))),
            )
          ],
        ),
        SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(width: 80, height: 3, color: Color(0xff333333)),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: '50',
                      style: GoogleFonts.rubik(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.red))),
            )
          ],
        ),
        SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 20,
                height: 5,
                padding: EdgeInsets.only(left: 30),
                color: Color(0xff333333)),
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
        SizedBox(height: 25),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(width: 20, height: 5, color: Color(0xff333333)),
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
          Container(child: _thermometerCenter()),
          Container(child: _thermometerRight())
        ],
      ),
    ));
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 50),
          _thermometerBody(),
        ],
      ),
    );
  }
}
