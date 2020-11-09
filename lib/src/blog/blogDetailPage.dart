import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogDetail extends StatefulWidget {
  dynamic params;
  BlogDetail({Key key, this.params}) : super(key: key);

  @override
  _blogDetailState createState() => _blogDetailState();
}

class _blogDetailState extends State<BlogDetail> {
  bool loadingImg = true;
  get item => widget.params;

  Widget _backButton() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width,
      height: 90,
      color: Colors.white,
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
              child: Text('Blog',
                  style: GoogleFonts.rubik(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333333)))),
        ],
      ),
    );
  }

  Widget _showLoading() {
    return AnimatedOpacity(
      opacity: 0.7,
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

  String getMobileImagePath(String path) {
    List<String> fnArr = path.split('/');
    fnArr[fnArr.length - 2] = fnArr[fnArr.length - 2] + '/m';
    String _path = fnArr.join('/');
    return _path;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String imgPath = getMobileImagePath(item['image']);
    var _image = NetworkImage(imgPath);
    _image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
        (info, call) {
          setState(() {
            loadingImg = false;  
          });
        },
      ),
    );

    return Scaffold(
        body: Container(
      height: size.height,
      decoration: BoxDecoration(color: Color(0xffFFFFFF)),
      child: Stack(
        children: <Widget>[
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[                      
                      Container(
                        height: 300,
                        margin: const EdgeInsets.only(
                            top: 100, left: 20.0, right: 20.0, bottom: 20.0),
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: 
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: _image,//NetworkImage(product['media_url']),
                              ),
                            ),
                          )
                          // Image.network(
                          //   item['image'],
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item['title'],
                          style: GoogleFonts.rubik(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff333333)),
                        ),
                        Text(item['created_date'],
                            style: GoogleFonts.rubik(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff333333).withOpacity(.5))),
                        Divider(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Html(
                      data: item['description'],
                      style: {
                        "p": Style(
                          fontFamily: 'Nunito',
                        ),
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(top: 0, left: 0, child: _backButton()),
          Positioned(
              left: 0,
              top: 0,
              child: loadingImg ? _showLoading() : Container()),
        ],
      ),
    ));
  }
}
