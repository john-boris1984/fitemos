import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';
import 'package:social_share_plugin/social_share_plugin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localstorage/localstorage.dart';

class ShareFitness extends StatefulWidget {
  dynamic params;
  ShareFitness({Key key, this.params}) : super(key: key);

  @override
  _shareFitnessState createState() => _shareFitnessState();
}

class _shareFitnessState extends State<ShareFitness> {
  get referral => widget.params;
  String message;
  String message1;
  final LocalStorage storage = new LocalStorage('fitemos_store');
  dynamic userInfo;
  bool showFlag = false;

  void updateState() {
    setState(() {
      dynamic user = storage.getItem('accessToken')['user'];
      if (user != null) {
        userInfo = user;
      }
      message =
          '${user['customer']['first_name']} ${user['customer']['last_name']} te invita a entrenar con Fitemos. Afíliate con este enlace: ${referral['referralUrl']} para obtener ${user['customer']['services']['1']['free_duration']} días de prueba sin compromiso y luego ${referral['discount']}% de descuento mensual.';
      message1 =
          '${user['customer']['first_name']} ${user['customer']['last_name']} te invita a entrenar con Fitemos. Afíliate con este enlace para obtener ${user['customer']['services']['1']['free_duration']} días de prueba sin compromiso y luego ${referral['discount']}% de descuento mensual.';
    });
  }

  @override
  void initState() {
    super.initState();
    updateState();
  }

  Widget _backButton() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      height: 90,
      child: Row(
        children: <Widget>[
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(left: 12, top: 11, bottom: 10),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              )),
          Container(
            padding: EdgeInsets.only(left: 6, top: 11, bottom: 10),
            child: Text('Invita a un amigo',
                style: GoogleFonts.rubik(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
        ],
      ),
    );
  }

  Widget _detailBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              "${userInfo['customer']['first_name']}, ¡Compartamos el Fitness!",
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333))),
          SizedBox(height: 15),
          Text(
              '\u2022 Al invitar un amigo, le enviarás 30 días de prueba, sin compromiso.',
              textAlign: TextAlign.justify,
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333))),
          SizedBox(height: 10),
          Text(
              '\u2022 De tu amigo quedarse entrenando contigo, ambos tendrán 10% descuento en cada renovación.',
              textAlign: TextAlign.justify,
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333))),
          SizedBox(height: 10),
          Text(
              '\u2022 Tu invitado tendrá el descuento inmediatamente. Tu lo tendrás en tu próxima renovación.',
              textAlign: TextAlign.justify,
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333))),
          SizedBox(height: 10),
          Text(
              '\u2022 El descuento será renovable. Siempre y cuando tengas uno o más invitados activos.',
              textAlign: TextAlign.justify,
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333))),
          SizedBox(height: 10),
          Text(
              '\u2022 Haz click en el boton de abajo, genera tu enlace e invita a tus amigos.',
              textAlign: TextAlign.justify,
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333))),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _btnGroup() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 50,
              height: 50,
              child: FloatingActionButton(
                heroTag: "btn1",
                backgroundColor: Colors.indigo,
                onPressed: () async {
                  final result =
                      await SocialSharePlugin.shareToFeedFacebookLink(
                    quote: message1,
                    url: '${referral['referralUrl']}',
                    onSuccess: (_) {
                      print('FACEBOOK SUCCESS');
                      return;
                    },
                    onCancel: () {
                      print('FACEBOOK CANCELLED');
                      return;
                    },
                    onError: (error) {
                      print('FACEBOOK ERROR $error');
                      return;
                    },
                  );

                  print(result);
                },
                child: FaIcon(FontAwesomeIcons.facebookF),
              ),
            ),
            SizedBox(width: 20),
            SizedBox(
              width: 50,
              height: 50,
              child: FloatingActionButton(
                heroTag: "btn2",
                backgroundColor: Colors.lightBlue,
                onPressed: () {
                  SocialShare.shareTwitter('Fitemos invitar',
                          url: '${referral['referralUrl']}',
                          trailingText: "\n" + message1.toString())
                      .then((data) {
                    print(data);
                  });
                },
                child: FaIcon(FontAwesomeIcons.twitter),
              ),
            ),
            SizedBox(width: 20),
            SizedBox(
              width: 50,
              height: 50,
              child: FloatingActionButton(
                heroTag: "btn3",
                backgroundColor: Colors.grey,
                onPressed: () {
                  SocialShare.shareSms("Fitemos invitar",
                          url: '${referral['referralUrl']}',
                          trailingText: "\n" + message1.toString())
                      .then((data) {
                    print(data);
                  });
                },
                child: FaIcon(FontAwesomeIcons.envelope),
              ),
            ),
            SizedBox(width: 20),
            SizedBox(
              width: 50,
              height: 50,
              child: FloatingActionButton(
                heroTag: "btn4",
                backgroundColor: Colors.green,
                onPressed: () {
                  SocialShare.shareWhatsapp(message).then((data) {
                    print(data);
                  });
                },
                child: FaIcon(FontAwesomeIcons.whatsapp),
              ),
            ),
          ]),
    );
  }

  Widget _bodyFooter() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          Text("Training Partners",
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                  fontSize: 21,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff333333))),
          SizedBox(height: 30),
          Text("No hay socios.",
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333))),
          SizedBox(height: 15),
        ],
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
                  print(Platform.isAndroid);
                  setState(() {
                    showFlag = !showFlag;
                  });
                },
                child: Text(
                  "INVITAR",
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              )),
          SizedBox(height: showFlag ? 30 : 0),
          showFlag ? _btnGroup() : Container(),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100),
                  _detailBody(),
                  SizedBox(height: 30),
                  _bodyForm(),
                  SizedBox(height: 30),
                  _bodyFooter(),
                  SizedBox(height: 30),
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
