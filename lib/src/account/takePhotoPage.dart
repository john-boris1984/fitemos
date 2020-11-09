import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fitemos/src/widget/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class TakePhotoPage extends StatefulWidget {
  // final int takenIndex;
  const TakePhotoPage({Key key}) : super(key: key);

  @override
  _TakePhotoPageState createState() => _TakePhotoPageState();
}

class _TakePhotoPageState extends State<TakePhotoPage> {
  String imagePath;
  File imageFile;
  bool takenFlag = false;
  int takenState = 0; // if 0, document and if 1, selfie
  String tmpStr = "";
  CameraController cameraController;
  List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();

    availableCameras().then((res) {
      if (res == null) return;
      cameras = res;
      cameraController =
          CameraController(cameras[0], ResolutionPreset.medium); // back camera
      cameraController.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //final mediaQueryData = MediaQuery.of(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: size.height,
      decoration: BoxDecoration(color: Color(0xffFFFFFF)),
      child: Stack(
        children: <Widget>[
          Container(
            // child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100),
                //_profileHeader(),
                Padding(
                    padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
                    child: Center(
                      child: _cameraPreviewWidget(),
                    )),
                //SizedBox(height: 15),
                const Spacer(),
                Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 25),
                    child: CustomBtn(
                        height: 48,
                        backColor: Color(0xff1A7998),
                        onPressed: () {
                          if (cameraController != null &&
                              cameraController.value.isInitialized &&
                              !cameraController.value.isRecordingVideo) {
                            onTakePictureButtonPressed();
                          }
                        },
                        fontSize: 16,
                        fontColor: Colors.white,
                        text: "Take Picture")),
              ],
            ),
            //),
          ),
          Positioned(top: 0, left: 0, child: _backButton()),
        ],
      ),
    ));

    //  Scaffold(
    //           key: _scaffoldKey,
    //           appBar: PreferredSize(
    //               child: AppBar(
    //                 bottomOpacity: 0.0,
    //                 elevation: 0.0,
    //                 backgroundColor: takenFlag
    //                     ? Colors.white
    //                     : Colors.black.withOpacity(0.33), //Color(0xffbcbcbc),
    //                 leading: BackButton(
    //                   color: takenFlag
    //                       ? BigtabyAppTheme.of(context).primaryColor100
    //                       : Colors.white,
    //                   onPressed: () {
    //                     if (takenFlag) {
    //                       setState(() {
    //                         takenFlag = false;
    //                       });
    //                     } else {
    //                       Navigator.pop(context);
    //                     }
    //                   },
    //                 ),
    //                 title: Text(
    //                   takenState == 0
    //                       ? 'Scan Personal ID or Passport'
    //                       : 'Take a Selfie',
    //                   style: TextStyle(
    //                       fontFamily: 'OpenSansBold',
    //                       fontSize: 16,
    //                       color: takenFlag
    //                           ? BigtabyAppTheme.of(context).primaryColor100
    //                           : Colors.white),
    //                 ),
    //               ),
    //               preferredSize: Size.fromHeight(
    //                   mediaQueryData.size.height * Global.appBarHeightRate)),
    //           body: Container(
    //                   padding: EdgeInsets.fromLTRB(36, 60, 36, 10),
    //                   color: Colors.black.withOpacity(0.33), //Color(0xffbcbcbc),
    //                   child: Column(
    //                     children: <Widget>[
    //                       Center(
    //                         child: _cameraPreviewWidget(),
    //                       ),
    //                       const SizedBox(
    //                         height: 48,
    //                       ),
    //                       Text(
    //                         takenState == 0
    //                             ? 'Now place your phone directly on top of your document id so we can connect securely'
    //                             : 'Now place your phone in front of you and take a selfie so we can easily identity you',
    //                         style: TextStyle(
    //                             fontFamily: 'OpenSansRegular',
    //                             fontSize: 12,
    //                             color: Colors.white),
    //                         textAlign: TextAlign.center,
    //                       ),
    //                       const Spacer(),
    //                       CustomButton(
    //                           height: 48,
    //                           backColor: BigtabyAppTheme.of(context).primaryColor300,
    //                           onPressed: () {
    //                             if (controller != null &&
    //                                 controller.value.isInitialized &&
    //                                 !controller.value.isRecordingVideo) {
    //                               onTakePictureButtonPressed();
    //                             }
    //                           },
    //                           fontSize: 14,
    //                           fontColor: Colors.white,
    //                           text: "Take Picture"),
    //                     ],
    //                   ),
    //                 )
    //         );
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget() {
    if (cameraController == null || !cameraController.value.isInitialized) {
      return const Text(
        'Tap a camera',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: cameraController.value.aspectRatio,
        child: CameraPreview(cameraController),
      );
    }
  }

  void showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void onTakePictureButtonPressed() {
    takePicture().then((String filePath) {
      if (mounted) {
        setState(() {
          imagePath = filePath;
          imageFile = File(filePath);
          takenFlag = true;
          Navigator.pop(context, imageFile);
        });
        //if (filePath != null) showInSnackBar('Picture saved to $filePath');
      }
    });
  }

  Future<String> takePicture() async {
    if (!cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.jpg';

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      await cameraController.takePicture(filePath);
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
    return filePath;
  }

  void logError(String code, String message) =>
      print('Error: $code\nError Message: $message');

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
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
              child: Text('Vista previa de la cámara',
                  style: GoogleFonts.rubik(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333333)))),
        ],
      ),
    );
  }
}
