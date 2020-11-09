import 'package:fitemos/src/utils/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:localstorage/localstorage.dart';
import 'package:fitemos/src/shop/productPage.dart';
import 'package:fitemos/src/utils/apiDataSource.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:page_transition/page_transition.dart';

class Business extends StatefulWidget {
  dynamic params;
  Business({Key key, this.params}) : super(key: key);

  @override
  _businessState createState() => _businessState();
}

class _businessState extends State<Business> {
  get item => widget.params;
  RestDatasource api = new RestDatasource();
  final LocalStorage storage = new LocalStorage('fitemos_store');
  dynamic productItems;
  //bool loadingFlag = true;
  bool loadingImg = true;

  _getShopItem(String pageSize, String pageNumber, String itemId) async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api
        .getShopItem(pageSize, pageNumber, accessToken, itemId)
        .then((GetShopItem res) {
      if (res == null) return;
      setState(() {
        productItems = res.returnData['products']['data'];
        //loadingFlag = false;
      });
    }).catchError((error) {});
  }

  @override
  void initState() {
    super.initState();
    _getShopItem('100', '0', item['id'].toString());
  }

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
                padding: EdgeInsets.only(left: 15, top: 11, bottom: 10),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              )),
          Container(
            padding: EdgeInsets.only(left: 6, top: 11, bottom: 10),
            child: Text(item['name'],
                style: GoogleFonts.rubik(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
        ],
      ),
    );
  }

  Widget _productDescription() {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item['description'],
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff333333))),
            const SizedBox(
              height: 8,
            ),
            item['phone'] != null
                ? Row(
                    children: [
                      Text('Telefono: ',
                          style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333))),
                      Text(item['phone'].toString(),
                          style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333)))
                    ],
                  )
                : Container(),
            const SizedBox(
              height: 8,
            ),
            item['address'] != null
                ? Row(
                    children: [
                      Text('Direccion: ',
                          style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333))),
                      Expanded(
                          child: Text(item['address'],
                              style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff333333))))
                    ],
                  )
                : Container(),

            const SizedBox(
              height: 8,
            ),
            item['website_url'] != null
                ? Row(
                    children: [
                      Text('website_url: ',
                          style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333))),
                      Text(item['website_url'],
                          style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff2D9CDB)))
                    ],
                  )
                : Container(),

            const SizedBox(
              height: 8,
            ),
            item['mail'] != null
                ? Row(
                    children: [
                      Text('Correo: ',
                          style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333))),
                      Text(item['mail'],
                          style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333)))
                    ],
                  )
                : Container(),
            const SizedBox(
              height: 8,
            ),
            item['facebook'] != null
                ? Row(
                    children: [
                      Text('Facebook: ',
                          style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333))),
                      Text(item['facebook'],
                          style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333)))
                    ],
                  )
                : Container(),
            const SizedBox(
              height: 8,
            ),
            item['horario'] != null
                ? Row(
                    children: [
                      Text('Horario: ',
                          style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333))),
                      Text(item['horario'],
                          style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333)))
                    ],
                  )
                : Container(),

            const SizedBox(
              height: 8,
            ),
            item['instagram'] != null
                ? Row(
                    children: [
                      Text('Instagram: ',
                          style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333))),
                      Text(item['instagram'],
                          style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333)))
                    ],
                  )
                : Container(),
            const SizedBox(
              height: 8,
            ),
            item['twitter'] != null
                ? Row(
                    children: [
                      Text('Twitter: ',
                          style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333))),
                      Text(item['twitter'],
                          style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333)))
                    ],
                  )
                : Container(),
            //const SizedBox(height: 8,),
          ],
        ));
  }

  String getMobileImagePath(String path) {
    List<String> fnArr = path.split('/');
    fnArr[fnArr.length - 2] = fnArr[fnArr.length - 2] + '/m';
    String _path = fnArr.join('/');
    return _path;
  }

  Widget _productItem(product) {
    String imgPath = product['media_url'];//getMobileImagePath(product['media_url']);
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

    final width = MediaQuery.of(context).size.width - 45;
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              // PageTransition(
              //     type: PageTransitionType.rightToLeft, //leftToRight,
              //     child: ProductPage(params: product))
              MaterialPageRoute(
                  builder: (context) => ProductPage(params: product)));
        },
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey, //.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5)),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 107,
                          width: width / 2 - 5,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  _image, //NetworkImage(product['media_url']),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: width / 2 - 5,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5)),
                          color: Color(0xffFFFFFF)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 8),
                            RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                    text: item['name'], //product['name'],
                                    style: GoogleFonts.rubik(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff333333)))),
                            SizedBox(height: 5),
                            product['discount'] == null
                                ? RichText(
                                    textAlign: TextAlign.left,
                                    text: TextSpan(text: '', children: [
                                      TextSpan(
                                        text: '\$${product['regular_price']}',
                                        style: GoogleFonts.rubik(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff333333),
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '  \$${product['price']}',
                                        style: GoogleFonts.rubik(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffEB5757),
                                        ),
                                      ),
                                    ]))
                                : RichText(
                                    textAlign: TextAlign.left,
                                    text: TextSpan(text: '', children: [
                                      TextSpan(
                                        text:
                                            '${product['discount']}% descuento',
                                        style: GoogleFonts.rubik(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffEB5757),
                                        ),
                                      ),
                                    ])),
                            SizedBox(height: 8),
                          ])),
                ])));
  }

  Widget _productHeader() {
    String logoPath = getMobileImagePath(item['logo']);

    final width = MediaQuery.of(context).size.width - 40;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey, //.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Image.network(
            logoPath,//item['logo'],
            fit: BoxFit.cover,
            width: double.maxFinite,
          ),
        ),
      ),
    );
  }

  Widget _showLoading() {
    return AnimatedOpacity(
      opacity: 0.7,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 6000),
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
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Color(0xffFFFFFF)),
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100),
                  _productHeader(),
                  SizedBox(height: 20),
                  _productDescription(),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    child: GridView.count(
                      padding: EdgeInsets.all(0.0),
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                          productItems != null ? productItems.length : 0,
                          (index) {
                        return Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                _productItem(productItems[index]),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 20),
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
