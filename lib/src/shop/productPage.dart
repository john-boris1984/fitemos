import 'dart:async';
import 'dart:io';
import 'package:fitemos/src/utils/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:fitemos/src/utils/apiDataSource.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatefulWidget {
  dynamic params;
  ProductPage({Key key, this.params}) : super(key: key);

  @override
  _productPageState createState() => _productPageState();
}

class _productPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  get param => widget.params;
  dynamic product;
  RestDatasource api = new RestDatasource();
  final LocalStorage storage = new LocalStorage('fitemos_store');
  dynamic galleries;
  String gallery;
  dynamic productItems;
  String _openResult = 'Unknown';
  bool loadingFlag = false;

  _getGalleriesItem(String pageSize, String pageNumber, String itemId) async {
    //  String accessToken = storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api
        .getGalleries(pageSize, pageNumber, accessToken, itemId)
        .then((GetShopItem item) {
      setState(() {
        product = item.returnData['product'];
        gallery = product['gallery'][0]['image'];
        galleries = item.returnData['product']['gallery'];
        productItems = item.returnData['products'];
      });
    }).catchError((error) {});
  }

  Future<void> openFile(String filePath) async {
    final result = await OpenFile.open(filePath);
    setState(() {
      _openResult = "type=${result.type}  message=${result.message}";
    });
  }

  _downloadBrochure(String itemId) async {
    //  String accessToken = storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    api.downloadBrochure(appDocPath, itemId, accessToken).then((Download item) {
      openFile(item.returnData.path);
      loadingFlag = false;
    }).catchError((error) {
      print(error);
      loadingFlag = false;
    });
  }

  Widget _showLoading() {
    return AnimatedOpacity(
      opacity: 0.6, //opacityFlag ? 1 : 0,
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

  @override
  void initState() {
    super.initState();
    product = param;
    _getGalleriesItem('100', '0', product['id'].toString());
    gallery = product['media_url'];
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
                padding: EdgeInsets.only(left: 15, top: 11, bottom: 10),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              )),
          Container(
            padding: EdgeInsets.only(left: 6, top: 11, bottom: 10),
            child: Text(product['name'],
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
      child: Text(product['description'],
          style: GoogleFonts.rubik(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color(0xff333333))),
    );
  }

  Widget _productHeader() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          //border: Border.all(color: Color(0xffFFFFFF), width: 0.7, style: BorderStyle.solid),
          boxShadow: [
            BoxShadow(
              color: Colors.grey, //.withOpacity(0.9),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(gallery),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _galleryItem(item) {
    return InkWell(
      onTap: () {
        setState(() {
          gallery = item['image'];
        });
        print(item['id']);
      },
      child: Container(
        height: 76,
        width: 86,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(
              color: Colors.grey.withOpacity(0.9),
              width: 0.7,
              style: BorderStyle.solid),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(item['thumbnail']),
          ),
        ),
      ),
    );
  }

  Widget _buildImagesGrid() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 110,
      //  child: ListView.builder(
      //    scrollDirection: Axis.horizontal,
      //    itemCount: galleries != null? galleries.length : 0,
      //    itemBuilder: (BuildContext context, int index) {
      //      return Align(
      //        alignment: Alignment.center,
      //        child: Container(
      //          child: Row(
      //            crossAxisAlignment: CrossAxisAlignment.start,
      //            mainAxisAlignment: MainAxisAlignment.start,
      //            children: <Widget>[
      //              _galleryItem(galleries[index]),
      //              SizedBox(width: 15),
      //            ],
      //          ),
      //        ),
      //      );
      //    },
      //  ),
    );
  }

  Widget _priceSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: product['discount'] == null
          ? RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                  text: 'Oferta:  ',
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff333333),
                  ),
                  children: [
                    TextSpan(
                      text: '\$${product['regular_price']}',
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff333333),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    TextSpan(
                      text: '  \$${product['price']}',
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffEB5757),
                      ),
                    ),
                  ]))
          : RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                  text: 'Oferta:  ',
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff333333),
                  ),
                  children: [
                    TextSpan(
                      text: '${product['discount']}% descuento',
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffEB5757),
                      ),
                    ),
                  ])),
    );
  }

  Widget _priceDescription() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: 'Usage ${product['voucher_type']}',
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
          )),
    );
  }

  Widget _printButton() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: FlatButton(
          color: Color(0xff1A7998),
          textColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
          splashColor: Colors.cyan,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
          onPressed: () {
            setState(() {
              loadingFlag = true;
              _downloadBrochure(product['id'].toString());
            });
          },
          child: Text(
            "Descargar Voucher",
            style: GoogleFonts.rubik(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ));
  }

  Widget _productItem(product) {
    final width = MediaQuery.of(context).size.width - 45;
    return InkWell(
        onTap: () {
          _getGalleriesItem('100', '0', product['id'].toString());
        },
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
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
                          width: width / 2 - 5,
                          height: 120,
                          child: Image.network(
                            product['media_url'],
                            fit: BoxFit.cover,
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
                                    text: product['name'],
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 100),
                  _productHeader(),
                  _buildImagesGrid(),
                  SizedBox(height: 10),
                  _productDescription(),
                  SizedBox(height: 15),
                  _priceSection(),
                  SizedBox(height: 20),
                  _printButton(),
                  SizedBox(height: 10),
                  (productItems?.length != 0)
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: 'Artículos Relacionados',
                              style: GoogleFonts.rubik(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff333333)),
                            ),
                          ),
                        )
                      : Container(),
                  SizedBox(height: 10),
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
              child: loadingFlag ? _showLoading() : Container()),
        ],
      ),
    ));
  }
}
