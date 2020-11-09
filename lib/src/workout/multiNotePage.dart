import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class MultiNote extends StatefulWidget {
  dynamic params;
  MultiNote({Key key, this.params}) : super(key: key);

  @override
  _multiNoteState createState() => _multiNoteState();
}

class _multiNoteState extends State<MultiNote> {
  dynamic get workoutData => widget.params;
  int workoutItemsLength;
  dynamic workoutItems = [];
  String backTitle = '';
  bool isRead = false;

  @override
  void initState() {
    for (var i = 0; i < workoutData['blocks'].length; i++) {
      if (i != 0) workoutItems.add(workoutData['blocks'][i]);
    }
    workoutItemsLength = workoutItems.length;
    backTitle = workoutData['short_date'];
    print(workoutData['date']);
    if (workoutData['read'] == true)
      isRead = true;
    else
      isRead = false;
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
        Navigator.pop(context);
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

  showNotDialog(BuildContext context, item) {
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
        Navigator.pop(context);
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
              text: 'Notas',
              style: GoogleFonts.rubik(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xff333333),
              ))),
      content: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
              text: item[0]['before_content'],
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

  Widget _buttonFollowing(item) {
    return InkWell(
        onTap: () {
          showNotDialog(context, item);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 40,
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  border: Border.all(
                      color: Color(0xff333333),
                      width: 1.0,
                      style: BorderStyle.solid),
                  color: Colors.transparent),
              child: Text(
                'Ver notas',
                style: GoogleFonts.rubik(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff333333)),
              ),
            ),
          ],
        ));
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context, false);
      },
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 25),
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 11, top: 11, bottom: 10),
                child:
                    Icon(Icons.keyboard_arrow_left, color: Color(0xff333333)),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 44,
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Text(
              backTitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemContent(item) {
    if (item['tag'] == "h1") {
      return Container(
          margin: EdgeInsets.only(top: 20),
          child: RichText(
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              text: TextSpan(
                  text: item['content'],
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff333333),
                  ))));
    } else if (item['tag'] == "h2") {
      return Container(
          margin: EdgeInsets.only(top: 10),
          child: RichText(
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              text: TextSpan(
                  text: item['content'],
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff333333),
                  ))));
    } else if (item['tag'] == "modal") {
      return Container(
          margin: EdgeInsets.only(top: 10),
          child: SizedBox(
              height: 25,
              child: FlatButton(
                  color: Color(0xffcacaca),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  onPressed: () {
                    showAlertDialog(context, item['title'], item['body']);
                  },
                  child: Text(
                    item['title'],
                    style: GoogleFonts.rubik(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff333333)),
                  ))));
    } else {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Wrap(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 3, right: 10),
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                    text: item['before_content'],
                    style: GoogleFonts.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff333333),
                    )),
              ),
            ),
            item['youtube'] != null
                ? SizedBox(
                    height: 25,
                    child: FlatButton(
                        color: Color(0xffcacaca),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        onPressed: () async {
                          if (await canLaunch(
                              'https://www.youtube.com/watch?v=${item['youtube']['name']}')) {
                            await launch(
                                'https://www.youtube.com/watch?v=${item['youtube']['vid']}');
                          }
                        },
                        child: Text(
                          item['youtube']['name'],
                          style: GoogleFonts.rubik(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333)),
                        )))
                : Container(
                    width: 0,
                  ),
            Container(
              padding: EdgeInsets.only(top: 3, right: 10),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: item['after_content'],
                      style: GoogleFonts.rubik(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff333333),
                      ))),
            ),
            Container(
              padding: EdgeInsets.only(top: 3, right: 10),
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                    text: item['after_content'],
                    style: GoogleFonts.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff333333),
                    )),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _workoutWidget(workoutContent) {
    if (workoutContent != null) {
      return ListView.builder(
        padding: EdgeInsets.all(0.0),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: workoutContent.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _itemContent(workoutContent[index]),
            ],
          );
        },
      );
    } else {
      return Container();
    }
  }

  Widget _start() {
    return InkWell(
      onTap: () async {
        setState(() {
          Navigator.pop(context, true);
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        padding: EdgeInsets.symmetric(vertical: 9),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            color: Color(0xff1A7998)),
        child: Text(
          'Iniciar Workout',
          style: GoogleFonts.rubik(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color(0xffFFFFFF)),
        ),
      ),
    );
  }

  Widget _buttonGroup() {
    return InkWell(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_start()],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    ListView listView = ListView.separated(
      padding: EdgeInsets.all(0.0),
      shrinkWrap: true,
      itemCount: workoutItems.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _workoutWidget(workoutItems[index]['content']),
            SizedBox(height: 20),
            workoutItems[index]['note'] != null
                ? _buttonFollowing(workoutItems[index]['note'])
                : Container(),
            SizedBox(height: 20),
          ],
        );
      },
    );

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Color(0xffFFFFFF)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(child: _backButton()),
          SizedBox(height: 5),
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20), child: listView),
          ),
          SizedBox(height: 20),
          _buttonGroup(),
          SizedBox(height: 20),
        ],
      ),
    ));
  }
}
