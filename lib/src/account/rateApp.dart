import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:fitemos/src/account/rateContent.dart';
import 'package:google_fonts/google_fonts.dart';

class RateApp extends StatefulWidget {
  RateApp({Key key}) : super(key: key);

  @override
  _rateAppState createState() => _rateAppState();
}

class _rateAppState extends State<RateApp> {
  WidgetBuilder builder = buildProgressIndicator;

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
              child: Text('Déjanos una Valoración',
                  style: GoogleFonts.rubik(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333333)))),
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
                  RateMyAppBuilder(
                    builder: builder,
                    onInitialized: (context, rateMyApp) {
                      setState(() => builder =
                          (context) => ContentWidget(rateMyApp: rateMyApp));
                      rateMyApp.conditions.forEach((condition) {
                        if (condition is DebuggableCondition) {
                          print(condition.valuesAsString);
                        }
                      });
                      print('Are all conditions met ? ' +
                          (rateMyApp.shouldOpenDialog ? 'Yes' : 'No'));
                      if (rateMyApp.shouldOpenDialog) {
                        rateMyApp.showRateDialog(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(top: 0, left: 0, child: _backButton()),
        ],
      ),
    ));
  }

  static Widget buildProgressIndicator(BuildContext context) =>
      const Center(child: CircularProgressIndicator());
}
