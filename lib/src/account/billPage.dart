import 'dart:io';
import 'dart:async';
import 'dart:convert';
//import 'package:camera/camera.dart';
import 'package:country_pickers/country.dart';
import 'package:fitemos/src/account/takePhotoPage.dart';
import 'package:fitemos/src/utils/session_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:fitemos/src/utils/apiDataSource.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:localstorage/localstorage.dart';
import 'package:fitemos/src/account/weightSetting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
//import 'package:page_transition/page_transition.dart';
import 'package:fitemos/src/page_transition.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BillPage extends StatefulWidget {
  BillPage({Key key}) : super(key: key);

  @override
  _billState createState() => _billState();
}

class _billState extends State<BillPage> {
  dynamic userData;
  RestDatasource api = new RestDatasource();
  final LocalStorage storage = new LocalStorage('fitemos_store');
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('507');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  final GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();
  bool _passAutoValidate = false;
  File imageFile;
  //final picker = ImagePicker();

  List<String> selectItems = new List();

  String _email;
  String _password;
  String _confirmPassword;

  String avatarImg = 'https://fitemos.com/storage/media/avatar/X-man-small.jpg';
  String customerHeight;
  String customerHeightUnit;
  String customerWeight;
  String customerWeightUnit;
  String _firstName;
  String _lastName;
  String _height;
  String _whatNumber;
  String _gender = 'Male';
  String _phoneCode = '507';
  dynamic _genderLabel = {'Male': 'Masculino', 'Female': 'Femenino'};
  bool isUpdated = false;
  bool isEmailUpdated = false;
  bool isAvatar = false;
  bool showBtnGroup = false;

  @override
  void initState() {
    super.initState();
    selectItems.add('Masculino');
    selectItems.add('Femenino');
    userData = storage.getItem('accessToken')['user'];

    if (SessionManager.getAvatar() != '')
      avatarImg = SessionManager.getAvatar();

    _updateState(userData);
  }

  void _updateState(userData) {
    setState(() {
      if (userData['avatar'] != null) {
        avatarImg = userData['avatarUrls']['medium'];
      }
      if (userData['customer']['current_height'] != null) {
        _height = (double.parse(userData['customer']['current_height']).toInt())
            .toString();
        customerHeightUnit = userData['customer']['current_height_unit'];
      } else {
        _height = (double.parse(userData['customer']['initial_height']).toInt())
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
      _firstName = userData['customer']['first_name'];
      _lastName = userData['customer']['last_name'];
      _email = userData['customer']['email'];
      if (userData['customer']['country_code'] != null) {
        _selectedDialogCountry = CountryPickerUtils.getCountryByIsoCode(
            userData['customer']['country_code']);
        _phoneCode = _selectedDialogCountry.phoneCode;
      }
      if (userData['customer']['whatsapp_phone_number'] != null) {
        _whatNumber = userData['customer']['whatsapp_phone_number']
            .toString()
            .replaceAll(_phoneCode, '');
      } else
        _whatNumber = '';
      _gender = userData['customer']['gender'];
    });
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
        isAvatar = false;
        showBtnGroup = true;
      });
    }
  }

  void _clearImage() {
    imageFile = null;
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

  _updateEmailOnly(String email) async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api.updateEmailOnly(email, accessToken).then((Account returnVal) async {
      _updateUserInfo();
    }).catchError((error) {});
  }

  _updatePassword(String password) async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api.updatePassword(password, accessToken).then((Account returnVal) async {
      Navigator.pop(context);
    }).catchError((error) {});
  }

  updateChangedInfor() async {
    // String accessToken =
    //     storage.getItem('accessToken')['authentication']['accessToken'];
    String accessToken = SessionManager.getToken();

    api
        .updateChangedInfor(
            _firstName,
            _lastName,
            _phoneCode + _whatNumber,
            _selectedDialogCountry.name,
            _selectedDialogCountry.isoCode.toLowerCase(),
            _height,
            _gender,
            accessToken)
        .then((Account returnVal) async {
      setState(() {
        isUpdated = true;
      });
      if (isEmailUpdated)
        _updateEmailOnly(_email);
      else
        _updateUserInfo();
    }).catchError((error) {});
  }

  Widget _buildDialogItem(Country country) => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: 1.0, color: Color(0xff333333).withOpacity(0.5)),
          ),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 20,
              child: CountryPickerUtils.getDefaultFlagImage(country),
            ),
            SizedBox(width: 10.0),
            Flexible(
                child: Text(country.name,
                    style: GoogleFonts.rubik(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))))
          ],
        ),
      );

  Widget _buildWhatItem(Country country) => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                _openCountryPickerDialog();
              },
              child: Container(
                width: 20,
                child: CountryPickerUtils.getDefaultFlagImage(country),
              ),
            ),
            SizedBox(width: 10.0),
            InkWell(
              onTap: () {
                _openCountryPickerDialog();
              },
              child: Text('+${country.phoneCode}',
                  style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333333))),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: TextFormField(
                initialValue: _whatNumber,
                keyboardType: TextInputType.phone,
                style: GoogleFonts.rubik(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333)),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xff333333).withOpacity(0.5),
                          width: 1.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff333333), width: 1.0)),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 7),
                ),
                validator: validateWhatNuber,
                onSaved: (String val) {
                  _whatNumber = val;
                },
              ),
            ),
          ],
        ),
      );

  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: CountryPickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: Text('Selecciona tu ubicación',
                style: GoogleFonts.rubik(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
            onValuePicked: (Country country) => setState(() {
              _selectedDialogCountry = country;
              _phoneCode = country.phoneCode;
            }),
            itemBuilder: _buildDialogItem,
            priorityList: [
              CountryPickerUtils.getCountryByIsoCode('PA'),
            ],
          ),
        ),
      );

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
                Navigator.pop(context, isUpdated);
              },
              child: Container(
                padding: EdgeInsets.only(left: 15, top: 11, bottom: 10),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              )),
          Container(
              padding: EdgeInsets.only(left: 6, top: 11, bottom: 10),
              child: Text('Cuenta',
                  style: GoogleFonts.rubik(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333333)))),
        ],
      ),
    );
  }

  Widget _btnFromTypeGroup() {
    return Container(
      height: 35,
      width: 35,
      child: FittedBox(
        child: FloatingActionButton(
          heroTag: "btn4",
          backgroundColor: Colors.green,
          mini: true,
          onPressed: () {
            _pickImageFromCamera();
          },
          child: FaIcon(FontAwesomeIcons.camera, size: 22),
        ),
      ),
      // Row(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       FloatingActionButton(
      //         heroTag: "btn4",
      //         backgroundColor: Colors.green,
      //         mini: true,
      //         onPressed: () {
      //           _pickImageFromCamera();
      //         },
      //         child: FaIcon(FontAwesomeIcons.camera, size: 17),
      //       ),
      //       SizedBox(width: 15),
      //       // FloatingActionButton(
      //       //   heroTag: "btn5",
      //       //   backgroundColor: Colors.green,
      //       //   onPressed: () {
      //       //     _pickImage();
      //       //   },
      //       //   child: FaIcon(FontAwesomeIcons.listAlt),
      //       // ),
      //     ]),
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
              setState(() {
                // isAvatar = !isAvatar;
                // _pickImage();
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
                                        'Usar cámara', //'Take Photo',
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
                                        'Escoger de la galería', //'Choose from Gallery',
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
              });
            },
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

  Widget _locationField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Ubicación",
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333).withOpacity(0.7)),
            ),
          ),
          ListTile(
            onTap: _openCountryPickerDialog,
            title: _buildDialogItem(_selectedDialogCountry),
          ),
        ],
      ),
    );
  }

  showSelectDialog(BuildContext context) {
    // set up the SimpleDialog
    SimpleDialog dialog = SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      title: Text('Género',
          style: GoogleFonts.rubik(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xff333333))),
      children: selectItems.map((value) {
        return new SimpleDialogOption(
          onPressed: () {
            setState(() {
              if (value == 'Masculino')
                _gender = 'Male';
              else
                _gender = 'Female';
            });
            Navigator.pop(context, selectItems.indexOf(value));
          },
          child: Text(value,
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff333333))), // value
        );
      }).toList(),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  Widget _passwordContent() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Contraseña',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333).withOpacity(0.7)),
            ),
            TextFormField(
              obscureText: true,
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xff333333).withOpacity(0.5), width: 1.0)),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff333333), width: 1.0)),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 7),
              ),
              keyboardType: TextInputType.text,
              onChanged: (String val) {
                _password = val;
              },
            ),
            SizedBox(height: 30),
            Text(
              'Confirmar Contraseña',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333).withOpacity(0.7)),
            ),
            TextFormField(
              obscureText: true,
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xff333333).withOpacity(0.5), width: 1.0)),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff333333), width: 1.0)),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 7),
              ),
              keyboardType: TextInputType.text,
              validator: validatePassword,
              onSaved: (String val) {
                _confirmPassword = val;
              },
            ),
          ],
        ));
  }

  void _validatePassInputs(BuildContext context) {
    if (_passwordKey.currentState.validate()) {
      _passwordKey.currentState.save();
      _updatePassword(_confirmPassword);
    } else {
      setState(() {
        _passAutoValidate = true;
      });
    }
  }

  showConfirmDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      shape: RoundedRectangleBorder(side: BorderSide(color: Color(0xff333333))),
      child: Text('Cancelar',
          style: GoogleFonts.rubik(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xff333333))),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      color: Colors.blue,
      child: Text('Actualizar',
          style: GoogleFonts.rubik(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xff333333))),
      onPressed: () {
        _validatePassInputs(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      title: Text('Contraseña',
          style: GoogleFonts.rubik(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xff333333))),
      content: Form(
        key: _passwordKey,
        autovalidate: _passAutoValidate,
        child: _passwordContent(),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget _buildGenderItem(String gender) => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: 1.0, color: Color(0xff333333).withOpacity(0.5)),
          ),
        ),
        child: Row(
          children: <Widget>[
            Flexible(
                child: Text(gender,
                    style: GoogleFonts.rubik(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))))
          ],
        ),
      );

  Widget _buildPasswordItem(String password) => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: 1.0, color: Color(0xff333333).withOpacity(0.5)),
          ),
        ),
        child: Row(
          children: <Widget>[
            Flexible(
                child: Text(password,
                    style: GoogleFonts.rubik(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))))
          ],
        ),
      );

  Widget _buildWeightItem(String peso) => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: 1.0, color: Color(0xff333333).withOpacity(0.5)),
          ),
        ),
        child: Row(
          children: <Widget>[
            Flexible(
                child: Text(peso,
                    style: GoogleFonts.rubik(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))))
          ],
        ),
      );

  Widget _genderField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Género",
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333).withOpacity(0.7)),
            ),
          ),
          ListTile(
            title: _buildGenderItem(_genderLabel[_gender]),
            onTap: () {
              showSelectDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Actualizar Contraseña",
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333).withOpacity(0.7)),
            ),
          ),
          ListTile(
            title: _buildPasswordItem('******'),
            onTap: () {
              showConfirmDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _weightField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Peso",
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333).withOpacity(0.7)),
            ),
          ),
          ListTile(
            title: _buildWeightItem(customerWeight + customerWeightUnit),
            onTap: () async {
              var result = await Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft, //leftToRight,
                      child: WeightSetting()));

              if (result) {
                _updateUserInfo();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _whatsApp() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Whatsapp",
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333).withOpacity(0.7)),
            ),
          ),
          _buildWhatItem(_selectedDialogCountry),
        ],
      ),
    );
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
            _validateInputs();
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

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      updateChangedInfor();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  String validateWhatNuber(String value) {
    Pattern pattern = r"^(0|[1-9][0-9]*)$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Inválido numero de telefono';
    else
      return null;
  }

  String validatePassword(String value) {
    print(_password);
    if (_password != value)
      return 'contraseña no coincidente';
    else
      return null;
  }

  String validateFirstName(String value) {
    Pattern pattern = r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Inválido Nombre';
    else
      return null;
  }

  String validateHeight(String value) {
    Pattern pattern = r"^\d+(\.\d+)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Inválido Altura';
    else
      return null;
  }

  String validateLastName(String value) {
    Pattern pattern = r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Inválido Apellido';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Inválido correo';
    else
      return null;
  }

  Widget formUI() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Nombre',
            style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff333333).withOpacity(0.7)),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            initialValue: _firstName,
            keyboardType: TextInputType.text,
            style: GoogleFonts.rubik(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff333333)),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xff333333).withOpacity(0.5), width: 1.0)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff333333), width: 1.0)),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 7),
            ),
            validator: validateFirstName,
            onSaved: (String val) {
              _firstName = val;
            },
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Apellido',
            style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff333333).withOpacity(0.7)),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            initialValue: _lastName,
            keyboardType: TextInputType.text,
            style: GoogleFonts.rubik(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff333333)),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xff333333).withOpacity(0.5), width: 1.0)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff333333), width: 1.0)),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 7),
            ),
            validator: validateLastName,
            onSaved: (String val) {
              _lastName = val;
            },
          ),
        ),
        // SizedBox(
        //   height: 20.0,
        // ),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 20),
        //   child: Text(
        //     'Altura',
        //     style: GoogleFonts.rubik(
        //         fontSize: 14,
        //         fontWeight: FontWeight.w500,
        //         color: Color(0xff333333).withOpacity(0.7)),
        //   ),
        // ),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 20),
        //   child: TextFormField(
        //     initialValue: _height,
        //     keyboardType: TextInputType.number,
        //     style: GoogleFonts.rubik(
        //         fontSize: 16,
        //         fontWeight: FontWeight.w500,
        //         color: Color(0xff333333)),
        //     decoration: InputDecoration(
        //       enabledBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(
        //               color: Color(0xff333333).withOpacity(0.5), width: 1.0)),
        //       focusedBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(color: Color(0xff333333), width: 1.0)),
        //       isDense: true,
        //       contentPadding: EdgeInsets.symmetric(vertical: 7),
        //     ),
        //     validator: validateHeight,
        //     onSaved: (String val) {
        //       _height = val;
        //     },
        //   ),
        // ),
        // SizedBox(
        //   height: 20.0,
        // ),
        // _weightField(),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Email',
            style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff333333).withOpacity(0.7)),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            initialValue: _email,
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.rubik(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff333333)),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xff333333).withOpacity(0.5), width: 1.0)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff333333), width: 1.0)),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 7),
            ),
            validator: validateEmail,
            onSaved: (String val) {
              if (val != _email) {
                setState(() {
                  isEmailUpdated = true;
                });
              }
              _email = val;
            },
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        _passwordField(),
        SizedBox(
          height: 20.0,
        ),
        _locationField(),
        SizedBox(
          height: 20.0,
        ),
        _whatsApp(),
        SizedBox(
          height: 20.0,
        ),
        _genderField(),
      ],
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
                  _profileHeader(),
                  SizedBox(height: 15),
                  Form(
                    key: _formKey,
                    autovalidate: _autoValidate,
                    child: formUI(),
                  ),
                  SizedBox(height: 15),
                  _saveButton(),
                  SizedBox(height: 15),
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
