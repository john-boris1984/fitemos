import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationSetting extends StatefulWidget {
  NotificationSetting({Key key}) : super(key: key);

  @override
  _notificationSettingState createState() => _notificationSettingState();
}

class _notificationSettingState extends State<NotificationSetting> {
  WidgetBuilder builder = buildProgressIndicator;
  bool checkedMonday = true;
  bool checkedTuesday = true;
  bool checkedWednesday = true;
  bool checkedThursday = false;
  bool checkedFriday = true;
  bool checkedSaturday = true;
  bool checkedSunday = false;
  DateTime _dateTime = DateTime.now();
  final timeEditController = TextEditingController();

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
              child: Text('Configuración de Notificación',
                  style: GoogleFonts.rubik(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333333)))),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    timeEditController.dispose();
    super.dispose();
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
            child: SingleChildScrollView(child: ntificationSettingBody()),
          ),
          Positioned(top: 0, left: 0, child: _backButton()),
        ],
      ),
    ));
  }

  ntificationSettingBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(16, 120, 16, 24),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  child: SizedBox(
                    width: Checkbox.width,
                    height: Checkbox.width,
                    child: Container(
                      decoration: new BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black87),
                        borderRadius: new BorderRadius.circular(3),
                      ),
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Colors.transparent,
                        ),
                        child: Checkbox(
                          value: checkedMonday,
                          onChanged: (state) =>
                              setState(() => checkedMonday = !checkedMonday),
                          activeColor: Colors.transparent,
                          checkColor: Colors.black87,
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text('Entrenamiento del Lunes',
                    style: TextStyle(
                        fontSize: 16,
                        //fontWeight: FontWeight.w600,
                        color: Colors.black87))
              ],
            )),

        // Tuesday
        Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  child: SizedBox(
                    width: Checkbox.width,
                    height: Checkbox.width,
                    child: Container(
                      decoration: new BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: new BorderRadius.circular(3),
                      ),
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Colors.transparent,
                        ),
                        child: Checkbox(
                          value: checkedTuesday,
                          onChanged: (state) =>
                              setState(() => checkedTuesday = !checkedTuesday),
                          activeColor: Colors.transparent,
                          checkColor: Colors.black87,
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text('Entrenamiento del martes',
                    style: TextStyle(
                        fontSize: 16,
                        //fontWeight: FontWeight.w600,
                        color: Colors.black87))
              ],
            )),

        // Wednesday
        Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  child: SizedBox(
                    width: Checkbox.width,
                    height: Checkbox.width,
                    child: Container(
                      decoration: new BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black87),
                        borderRadius: new BorderRadius.circular(3),
                      ),
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Colors.transparent,
                        ),
                        child: Checkbox(
                          value: checkedWednesday,
                          onChanged: (state) => setState(
                              () => checkedWednesday = !checkedWednesday),
                          activeColor: Colors.transparent,
                          checkColor: Colors.black87,
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text('Entrenamiento del miércoles',
                    style: TextStyle(
                        fontSize: 16,
                        //fontWeight: FontWeight.w600,
                        color: Colors.black87))
              ],
            )),

        // Thursday
        Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  child: SizedBox(
                    width: Checkbox.width,
                    height: Checkbox.width,
                    child: Container(
                      decoration: new BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black87),
                        borderRadius: new BorderRadius.circular(3),
                      ),
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Colors.transparent,
                        ),
                        child: Checkbox(
                          value: checkedThursday,
                          onChanged: (state) => setState(
                              () => checkedThursday = !checkedThursday),
                          activeColor: Colors.transparent,
                          checkColor: Colors.black87,
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text('Entrenamiento del Jueves',
                    style: TextStyle(
                        fontSize: 14,
                        //fontWeight: FontWeight.w600,
                        color: Colors.black87))
              ],
            )),

        // Friday
        Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  child: SizedBox(
                    width: Checkbox.width,
                    height: Checkbox.width,
                    child: Container(
                      decoration: new BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black87),
                        borderRadius: new BorderRadius.circular(3),
                      ),
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Colors.transparent,
                        ),
                        child: Checkbox(
                          value: checkedFriday,
                          onChanged: (state) =>
                              setState(() => checkedFriday = !checkedFriday),
                          activeColor: Colors.transparent,
                          checkColor: Colors.black87,
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text('Entrenamiento del sábado',
                    style: TextStyle(
                        fontSize: 16,
                        //fontWeight: FontWeight.w600,
                        color: Colors.black87))
              ],
            )),

        // Saturday
        Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  child: SizedBox(
                    width: Checkbox.width,
                    height: Checkbox.width,
                    child: Container(
                      decoration: new BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black87),
                        borderRadius: new BorderRadius.circular(3),
                      ),
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Colors.transparent,
                        ),
                        child: Checkbox(
                          value: checkedSaturday,
                          onChanged: (state) => setState(
                              () => checkedSaturday = !checkedSaturday),
                          activeColor: Colors.transparent,
                          checkColor: Colors.black87,
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text('Entrenamiento del viernes',
                    style: TextStyle(
                        fontSize: 16,
                        //fontWeight: FontWeight.w600,
                        color: Colors.black87))
              ],
            )),

        // Sunday
        Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  child: SizedBox(
                    width: Checkbox.width,
                    height: Checkbox.width,
                    child: Container(
                      decoration: new BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black87),
                        borderRadius: new BorderRadius.circular(3),
                      ),
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Colors.transparent,
                        ),
                        child: Checkbox(
                          value: checkedSunday,
                          onChanged: (state) =>
                              setState(() => checkedSunday = !checkedSunday),
                          activeColor: Colors.transparent,
                          checkColor: Colors.black87,
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text('Entrenamiento del domingo',
                    style: TextStyle(
                        fontSize: 14,
                        //fontWeight: FontWeight.w600,
                        color: Colors.black87))
              ],
            )),

        Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 10,
                    child: Text(
                      'Configuracion de hora',
                      style: TextStyle(
                        fontSize: 16,
                        //fontWeight: FontWeight.w600
                      ),
                    )),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      //width: 20,
                      height: 30,
                      child: TextField(
                        controller: timeEditController,
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 8, top: 2),
                          hintText: "7",
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            //color: Colors.redAccent
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    )),
                Text(
                  ' : ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      //width: 20,
                      height: 30,
                      child: TextField(
                        controller: timeEditController,
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 8, top: 2),
                          hintText: "00",
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            //color: Colors.redAccent
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    )),
                const SizedBox(
                  width: 100,
                )
              ],
            )),

        Padding(
            padding: EdgeInsets.fromLTRB(16, 220, 16, 16),
            child: Container(
              height: 48,
              width: double.maxFinite,
              color: Colors.grey,
              child: FlatButton(
                child: Text(
                  "Configurar",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                onPressed: () {
                  String time = timeEditController.text;

                  //Navigator.pop(context);
                },
              ),
            ))
      ],
    );
  }

  static Widget buildProgressIndicator(BuildContext context) =>
      const Center(child: CircularProgressIndicator());
}
