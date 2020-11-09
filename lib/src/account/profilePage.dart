import 'dart:io';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:fitemos/src/account/modifierPage.dart';
import 'package:fitemos/src/account/takePhotoPage.dart';
import 'package:fitemos/src/account/weightSetting.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:page_transition/page_transition.dart';
import 'package:fitemos/src/utils/apiDataSource.dart';
import 'package:fitemos/src/utils/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitemos/src/page_transition.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatefulWidget {
  dynamic workoutData;
  dynamic userData;
  dynamic historyData;
  Profile({Key key, this.workoutData, this.userData, this.historyData})
      : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<Profile> {
  get workoutData => widget.workoutData;
  get userData => widget.userData;
  get historyData => widget.historyData;
  dynamic userInfo;
  dynamic objectiveLabel = {
    'cardio': 'Perder peso',
    'fit': 'Ponerte en forma',
    'strong': 'Ganar musculatura'
  };
  String avatarImg = 'https://fitemos.com/storage/media/avatar/X-man-small.jpg';
  String customerHeight;
  String customerHeightUnit;
  String customerWeight;
  String customerWeightUnit;
  String customerIMC;
  String toWorkout = '';
  String workoutCount = '';
  String combineVal = '';
  double progressVal = 0.0;
  String level = '';
  String objective = '';
  String chartProgress = '';

  List<double> chartAxis = [];
  List<DataPoint> chartData = [];

  // for Altura menue
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  RestDatasource api = new RestDatasource();
  String _firstName;
  String _lastName;
  //String _height;
  String _whatNumber;
  String _gender = 'Male';
  String _phoneCode = '507';
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('507');
  bool isUpdated = false;
  File imageFile;
  bool isAvatar = false;
  bool showBtnGroup = false;

  @override
  void initState() {
    super.initState();

    if (userData != null) {
      userInfo = userData;
    }
    _updateState(userData);
    // if (userData['avatar'] != null) {
    //   avatarImg = userData['avatarUrls']['medium'];
    // }
    if (SessionManager.getAvatar() != '')
      avatarImg = SessionManager.getAvatar();


    workoutCount = workoutData['workoutCount'].toString();
    toWorkout = workoutData['toWorkout'].toString();
    combineVal = workoutCount + '/' + toWorkout;
    progressVal = 1 / double.parse(toWorkout) * double.parse(workoutCount);

    if (historyData['data'] != null) {
      if (historyData['data'].length > 0) {
        DateTime startDate = DateTime.parse(historyData['labels'][0]);
        chartProgress =
            historyData['data'][historyData['data'].length - 1].toString();
        for (var i = 0; i < historyData['labels'].length; i++) {
          DateTime endDate = DateTime.parse(historyData['labels'][i]);
          int daysToGenerate = endDate.difference(startDate).inDays;
          chartAxis.add(daysToGenerate.toDouble());
          chartData.add(DataPoint<double>(
              value: double.parse(historyData['data'][i].toString()),
              xAxis: daysToGenerate.toDouble()));
        }
      } else {
        chartAxis = [0, 10, 20];
        chartData = [
          DataPoint<double>(value: 0, xAxis: 0),
          DataPoint<double>(value: 0, xAxis: 10),
          DataPoint<double>(value: 0, xAxis: 20),
        ];
      }
    } else {
      chartAxis = [0, 10, 20];
      chartData = [
        DataPoint<double>(value: 0, xAxis: 0),
        DataPoint<double>(value: 0, xAxis: 10),
        DataPoint<double>(value: 0, xAxis: 20),
      ];
    }
  }

  void _updateState(userData) {
    setState(() {
      if (userData['customer']['current_height'] != null) {
        customerHeight =
            (double.parse(userData['customer']['current_height']).toInt())
                .toString();
        customerHeightUnit = userData['customer']['current_height_unit'];
      } else {
        customerHeight =
            (double.parse(userData['customer']['initial_height']).toInt())
                .toString();
        customerHeightUnit = userData['customer']['initial_height_unit'];
      }
      if (userData['customer']['current_weight'] != null) {
        customerWeight =
            (double.parse(userData['customer']['current_weight']).toInt())
                .toString();
        customerWeightUnit = userData['customer']['current_weight_unit'];
      } else {
        customerWeight =
            (double.parse(userData['customer']['initial_weight']).toInt())
                .toString();
        customerWeightUnit = userData['customer']['initial_weight_unit'];
      }
      if (userData['customer']['imc'] != null)
        customerIMC = userData['customer']['imc'].toString();
      else
        customerIMC = 0.toString();

      if (userData['customer']['current_condition'] != null)
        level = 'Nivel Físico ' +
            userData['customer']['current_condition'].toString();
      else
        level = 'Nivel Físico ' +
            userData['customer']['initial_condition'].toString();

      if (userData['customer']['objective'] != null) {
        objective = 'auto';
        if (objective == 'auto') {
          if (double.parse('${userData['customer']['imc']}') >= 25)
            objective = 'cardio';
          else if (double.parse('${userData['customer']['imc']}') <= 18.5)
            objective = 'strong';
          else
            objective = 'fit';
        }
      }
    });
  }

  _getCurrentLevel(String pageSize, String pageNumber) async {
    // String accessToken = storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api
        .getCurrentLevel(pageSize, pageNumber, accessToken)
        .then((Account levels) async {
      var result = await Navigator.push(
          context,
          PageTransition(
              // type: PageTransitionType.leftToRight,
              type: PageTransitionType.rightToLeft, //leftToRight,
              child: Modifier(currentLevel: levels.returnData)));
      if (result[0]) {
        setState(() {
          isUpdated = true;
          level = 'Nivel Físico ' + result[1].toString();
        });
      }
      if (result[0] != null) {
        setState(() {
          //clickFlag = true;
        });
      }
    }).catchError((error) {});
  }

  Widget _backButton() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 90,
      child: Row(
        children: <Widget>[
          InkWell(
              onTap: () {
                //Navigator.pop(context);
                Navigator.maybePop(context);
              },
              child: Container(
                padding: EdgeInsets.only(left: 15, top: 12, bottom: 10),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              )),
          Container(
              padding: EdgeInsets.only(left: 6, top: 11, bottom: 10),
              child: Text('Mi Perfil',
                  style: GoogleFonts.rubik(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333333)))),
        ],
      ),
    );
  }

  Widget alturaInput() {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: GoogleFonts.rubik(
          fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff333333)),
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0xff333333).withOpacity(0.5), width: 1.0)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff333333), width: 1.0)),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 7),
          hintText: customerHeight),
      validator: validateHeight,
      onSaved: (String val) {
        customerHeight = val;
      },
    );
  }

  String validateHeight(String value) {
    Pattern pattern = r"^\d+(\.\d+)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Inválido Altura';
    else
      return null;
  }

  Widget _saveButton() {
    return Container(
        width: MediaQuery.of(context).size.width / 2.3,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: FlatButton(
          color: Color(0xff1A7998),
          textColor: Colors.white,
          padding: EdgeInsets.all(3.0),
          splashColor: Colors.cyan,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
          onPressed: () {
            updateAltura();
          },
          child: Text(
            "Actualizar",
            style: GoogleFonts.rubik(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ));
  }

  updateAltura() async {
    String accessToken = SessionManager.getToken();
    api
        .updateChangedInfor(
            userInfo['customer']['first_name'], //._firstName,
            userInfo['customer']['last_name'], //_lastName,
            userInfo['customer']
                ['whatsapp_phone_number'], //_phoneCode + _whatNumber,
            userInfo['customer']['country'], //_selectedDialogCountry.name,
            userInfo['customer'][
                'country_code'], //_selectedDialogCountry.isoCode.toLowerCase(),
            customerHeight, //_height,
            userInfo['customer']['gender'], //_gender,
            accessToken)
        .then((Account res) async {
      if (res == null) return;
      setState(() {
        customerHeight = res.returnData['user']['customer']['current_height'];
        isUpdated = true;
      });
      Navigator.pop(context);
    }).catchError((error) {});
  }

  showAlturaDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog altura = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      titlePadding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 16.0),
      contentPadding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 25.0),
      title: Text(
        'Altura',
        style: GoogleFonts.rubik(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xff333333).withOpacity(0.7)),
      ),
      content: alturaInput(),
      actions: [
        _saveButton(),
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return altura;
      },
    );
  }

  updatePesoIMCinfo() async {
    String accessToken = SessionManager.getToken();
    api.updateUserInfo(accessToken).then((Account res) async {
      if (res == null) return;
      setState(() {
        customerWeight = res.returnData['user']['customer']['current_weight'];
        customerIMC = res.returnData['user']['customer']['imc'];
      });
      // _updateState(returnVal.returnData['user']);
    }).catchError((error) {});
  }

  Future<Null> _pickImageFromCamera() async {
    //imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    imageFile = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TakePhotoPage(),
      ),
    );
    if (imageFile != null) {
      _cropImage();
    }
  }

  Future<Null> _pickImage() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      _cropImage();
    }
  }

  Future<Null> _cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cultivadora',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black38,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cultivadora',
        ));
    if (croppedFile != null) {
      setState(() {
        imageFile = croppedFile;
        //avatarImg = imageFile.path;
        isAvatar = false;
        showBtnGroup = true;
      });
    }
  }

  void _clearImage() {
    imageFile = null;
  }

  Widget _profileBody() {
    final width = MediaQuery.of(context).size.width - 40;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
              onTap: () {
                showAlturaDialog(context);
              },
              child: Container(
                width: width / 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(children: [
                          TextSpan(
                            text: '$customerHeight',
                            style: GoogleFonts.rubik(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff333333),
                            ),
                          ),
                          TextSpan(
                            text: ' $customerHeightUnit',
                            style: GoogleFonts.rubik(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff333333),
                            ),
                          ),
                        ])),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text('Altura',
                          style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333))),
                    ),
                  ],
                ),
              )),
          InkWell(
              onTap: () async {
                var result = await Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft, //leftToRight,
                        child: WeightSetting()));
                if (result) {
                  updatePesoIMCinfo();
                }
              },
              child: Container(
                width: width / 4 * 2,
                padding: EdgeInsets.only(top: 0),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 1.0, color: Color(0xff333333)),
                    right: BorderSide(width: 1.0, color: Color(0xff333333)),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(children: [
                          TextSpan(
                            text: '$customerWeight',
                            style: GoogleFonts.rubik(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff333333),
                            ),
                          ),
                          TextSpan(
                            text: ' $customerWeightUnit',
                            style: GoogleFonts.rubik(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff333333),
                            ),
                          ),
                        ])),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text('Peso',
                          style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333))),
                    ),
                  ],
                ),
              )),
          Container(
            width: width / 4,
            padding: EdgeInsets.only(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(customerIMC,
                    style: GoogleFonts.rubik(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text('IMC',
                      style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff333333))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileHeader() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  content: Builder(
                    builder: (context) {
                      // Get available height and width of the build area of this widget. Make a choice depending on the size.
                      var height = MediaQuery.of(context).size.height;
                      var width = MediaQuery.of(context).size.width;

                      return Container(
                        height: height - 600,
                        width: width - 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 2,
                              color: Colors.blue,
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      _pickImageFromCamera();
                                    },
                                    child: Text(
                                      'Usar cámara',//'Take Photo',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ))),
                            Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      _pickImage();
                                    },
                                    child: Text(
                                      'Escoger de la galería',//'Choose from Gallery',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ))),
                            Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                            // Padding(
                            //     padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                            //     child: InkWell(
                            //         onTap: () {
                            //           Navigator.pop(
                            //               context); //.of(context)..pop(false);
                            //         },
                            //         child: Text(
                            //           'Cancel',
                            //           style: TextStyle(
                            //               fontSize: 14,
                            //               fontWeight: FontWeight.w500),
                            //         ))),
                          ],
                        ),
                      );
                    },
                  ),
                  title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(
                              'assets/svgs/window-close.svg',
                              height: 22,
                              width: 22,
                              semanticsLabel: 'exit'),
                          )
                        ),
                        Text(
                          'Agregar foto', //"Add Photo",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue),
                        )
                      ],
                    ),
                ),
              );
            },
            // child: Container(
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.all(Radius.circular(60)),
            //     child: Image.network(
            //       avatarImg,
            //       width: 120,
            //       height: 120,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            child: Stack(
              children: [
                imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(65)),
                        child: Image.file(
                          imageFile,
                          width: 130,
                          height: 130,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(65)),
                        child: Image.network(
                          avatarImg,
                          width: 130,
                          height: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                //SizedBox(height: isAvatar ? 20 : 0),
                // _btnFromTypeGroup() : Container(),
                // Positioned(
                //     left: 93,
                //     top: -3,
                //     // child: isAvatar ? _btnFromTypeGroup() : Container()),
                //     child: _btnFromTypeGroup()),
              ],
            ),
          ),
          SizedBox(height: showBtnGroup ? 10 : 0),
          showBtnGroup ? _btnGroup() : Container(),
          SizedBox(height: 10),
          Container(
            child: Text(
                '${userInfo['customer']['first_name']} ${userInfo['customer']['last_name']}',
                style: GoogleFonts.rubik(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          InkWell(
            onTap: () {
              _getCurrentLevel('100', '0');
            },
            child: Container(
              child: Text(level,
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff333333).withOpacity(0.6))),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Text('Objetivo',
                style: GoogleFonts.rubik(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Container(
            child: Text(objectiveLabel[objective],
                style: GoogleFonts.rubik(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff333333).withOpacity(0.6))),
          ),
        ],
      ),
    );
  }

  _updateUserInfo() async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api.updateUserInfo(accessToken).then((Account returnVal) async {
      _updateState(returnVal.returnData['user']);
      isUpdated = true;
      showBtnGroup = false;
    }).catchError((error) {});
  }

  _uploadAvatarImage() async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api
        .uploadAvatarImage(imageFile, accessToken)
        .then((Account returnVal) async {
      _updateUserInfo();
    }).catchError((error) {});
  }

  Widget _btnGroup() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 35,
                width: 35,
                child: FittedBox(
                  child: FloatingActionButton(
                      heroTag: "btn2",
                      backgroundColor: Colors.green,
                      onPressed: () {
                        setState(() {
                          _clearImage();
                          showBtnGroup = false;
                        });
                      },
                      child: FaIcon(
                        FontAwesomeIcons.trashAlt,
                        size: 22,
                        color: Colors.white,
                      )
                      //Icon(Icons.delete),
                      ),
                )),
            SizedBox(width: 20),
            Container(
                height: 35,
                width: 35,
                child: FittedBox(
                    child: FloatingActionButton(
                  heroTag: "btn3",
                  backgroundColor: Colors.green,
                  onPressed: () {
                    _uploadAvatarImage();
                  },
                  child: FaIcon(
                    FontAwesomeIcons.upload,
                    size: 22,
                    color: Colors.white,
                  ),
                ))),
          ]),
    );
  }

  Widget _workoutItem() {
    final width = MediaQuery.of(context).size.width - 40;
    return InkWell(
        child: Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 52.0,
            height: 52.0,
            decoration: BoxDecoration(
              color: Color(0xffD4ED6F).withOpacity(0.4),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Icon(
              Icons.favorite_border,
              color: Color(0xffAFCA32),
              size: 30.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: width - 150,
                  child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          text: combineVal,
                          style: GoogleFonts.rubik(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff333333)))),
                ),
                SizedBox(height: 5),
                Container(
                  width: width - 150,
                  padding: EdgeInsets.only(top: 10),
                  child: SizedBox(
                    height: 8.0,
                    child: LinearProgressIndicator(
                      backgroundColor: Color(0xffD4ED6F).withOpacity(0.4),
                      value: progressVal,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xffAFCA32)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _ProgressItem() {
    final width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: width,
        height: 180,
        child: BezierChart(
          bezierChartScale: BezierChartScale.CUSTOM,
          xAxisCustomValues: chartAxis,
          series: [
            BezierLine(
              lineColor: Color(0xffAFCA32),
              lineStrokeWidth: 4.0,
              data: chartData,
            ),
          ],
          config: BezierChartConfig(
            showDataPoints: false,
            backgroundColor: Colors.white,
            snap: false,
          ),
        ),
      ),
    );
  }

  Widget _profileWorkout() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 16),
            child: Text('Workouts',
                style: GoogleFonts.rubik(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 20),
          _workoutItem(),
        ],
      ),
    );
  }

  Widget _profileProgress() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text('Progreso',
                      style: GoogleFonts.rubik(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                ),
                Container(
                  child: Text(chartProgress,
                      style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff333333).withOpacity(0.5))),
                ),
              ]),
          _ProgressItem(),
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
                  _profileHeader(),
                  SizedBox(height: 20),
                  _profileBody(),
                  SizedBox(height: 10),
                  _profileWorkout(),
                  SizedBox(height: 20),
                  _profileProgress(),
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
