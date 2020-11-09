import 'dart:async';
import 'package:fitemos/src/utils/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:fitemos/src/shop/businessPage.dart';
import 'package:localstorage/localstorage.dart';
import 'package:fitemos/src/utils/apiDataSource.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:page_transition/page_transition.dart';

class Shop extends StatefulWidget {
  Shop({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _shopState createState() => _shopState();
}

class _shopState extends State<Shop> {
  RestDatasource api = new RestDatasource();
  final LocalStorage storage = new LocalStorage('fitemos_store');
  dynamic shopData;
  int currentPage;
  bool isLoading = false;
  bool loadingFlag = true;
  bool opacityFlag = true;
  bool loadingImg = true;

  _getShop(String pageSize, String pageNumber) async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api.getShopData(pageSize, pageNumber, accessToken).then((GetShop shops) {
      setState(() {
        shopData = shops.returnData['data'];
        currentPage = shops.returnData['current_page'];
        opacityFlag = false;
      });
      Future.delayed(const Duration(milliseconds: 601), () {
        setState(() {
          loadingFlag = false;
        });
      });
    }).catchError((error) {});
  }

  Widget _showLoading() {
    return AnimatedOpacity(
      opacity: opacityFlag ? 1 : 0,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 9000),
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

  @override
  void initState() {
    super.initState();
    _getShop('9', '0');
  }

  String getMobileImagePath(String path) {
    List<String> fnArr = path.split('/');
    fnArr[fnArr.length - 2] = fnArr[fnArr.length - 2] + '/m';
    String _path = fnArr.join('/');
    return _path;
  }

  Widget _blogItemBody(item, bool loadingImgFlag) {
    final width = MediaQuery.of(context).size.width - 32;

    String imgPath = item['logo'];//getMobileImagePath(item['logo']);
    var _image = NetworkImage(imgPath);
    _image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
        (info, call) {
          setState(() {
            loadingImgFlag = false;
          });
        },
      ),
    );


    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              // PageTransition(
              //     type: PageTransitionType.rightToLeft, //leftToRight,
              //     child: Business(params: item))
              MaterialPageRoute(
                builder: (context) => Business(params: item))
          );

        },
        child: Opacity(
            opacity: 1.0, //isDisabled ? 0.3 : 1.0,
            child: Card(
                margin: EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                elevation: 3, //10,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(12)),
                        child: loadingImgFlag 
                        ? Container(
                          width: width,
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff1A7998)),
                            )
                          ),
                        )
                        : Image.network(
                          imgPath, //item['logo'],
                          width: width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                          width: width,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12)),
                            //color: Colors.red,//Color(0xffFFFFFF)
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 10),
                                RichText(
                                    textAlign: TextAlign.left,
                                    text: TextSpan(
                                        text: item['name'],
                                        style: GoogleFonts.rubik(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff333333)))),
                                SizedBox(height: 10),
                              ])),
                    ]))));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    
    List<bool> loadingFlagList = [true];
    if(shopData!=null) {
      for (int i = 0; i < shopData.length; i++) {
        loadingFlagList.add(true);
      }
    }

    ListView listView = ListView.builder(
      itemCount: shopData != null ? shopData.length : 0,
      itemBuilder: (BuildContext context, int index) {
        return Align(
          alignment: Alignment.topCenter,
          //child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //SizedBox(height: 7),
              index == 0 ?
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15, top: 20, bottom: 20),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                        text: 'Shop',
                        style: GoogleFonts.rubik(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff333333)))), 
                ),
              )                
              :
              _blogItemBody(shopData[index], loadingFlagList[index]),
              //SizedBox(height: 7),
            ],
          ),
          //),
        );
      },
    );

    Container listViewContainer = Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white, //Color(0xFFE5E5E5), //Color(0xffFFFFFF)
      ),
      child: listView,
    );

    return Scaffold(
        body: Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white, //(0xFFE5E5E5), //Color(0xffFFFFFF)
      ),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Container(child: _backButton()),
              Flexible(
                child: listViewContainer,
                //flex: 3,//1,
              ),
            ],
          ),
          Positioned(
              left: 0,
              top: 0,
              child: loadingFlag ? _showLoading() : Container()),
        ],
      ),
    ));
  }
}
