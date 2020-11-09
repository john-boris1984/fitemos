import 'package:fitemos/src/utils/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:fitemos/src/utils/apiDataSource.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:localstorage/localstorage.dart';
import 'package:google_fonts/google_fonts.dart';

class Contact extends StatefulWidget {
  Contact({Key key}) : super(key: key);

  @override
  _contactState createState() => _contactState();
}

class _contactState extends State<Contact> {
  RestDatasource api = new RestDatasource();
  final LocalStorage storage = new LocalStorage('fitemos_store');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _message = '';

  _saveContactContent() async {
    // String accessToken = storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    String email = storage.getItem('accessToken')['user']['customer']['email'];
    String name = storage.getItem('accessToken')['user']['customer']
            ['first_name'] +
        ' ' +
        storage.getItem('accessToken')['user']['customer']['last_name'];
    api
        .saveContactContent(email, _message, name, accessToken)
        .then((Account returnVal) async {
      Navigator.pop(context);
    }).catchError((error) {});
  }

  String validateFirstName(String value) {
    Pattern pattern = r"^(?!\s*$).+";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Inválido Mensaje';
    else
      return null;
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _saveContactContent();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  Widget formUI() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        style: GoogleFonts.rubik(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xff333333)),
        maxLines: 6,
        decoration: InputDecoration.collapsed(hintText: " Ingresa tu mensaje"),
        validator: validateFirstName,
        onSaved: (String val) {
          _message = val;
        },
      ),
    );
  }

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
              child: Text('Contáctenos',
                  style: GoogleFonts.rubik(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333333)))),
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
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                    color: Color(0xff333333).withOpacity(0.4),
                    width: 0.7,
                    style: BorderStyle.solid),
                color: Color(0xffFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                autovalidate: _autoValidate,
                child: formUI(),
              ),
            ),
          ),
          SizedBox(height: 30),
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
                  _validateInputs();
                },
                child: Text(
                  "Enviar",
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              )),
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
                  SizedBox(height: 120),
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
