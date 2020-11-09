import 'dart:async';
import 'package:fitemos/src/utils/session_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class HeatingWidget extends StatefulWidget {
  String timerWork;
  HeatingWidget({Key key, this.timerWork}) : super(key: key);

  @override
  _heatingWidget createState() => _heatingWidget();
}

class _heatingWidget extends State<HeatingWidget>
    with SingleTickerProviderStateMixin {
  Timer timer;
  String timeText = '';
  double fontVal = 0;
  String statusFlag = 'Start';
  String buttonText = 'Start';
  bool showButton = false;
  bool showTitle = true;
  int get minutes => int.parse(widget.timerWork);
  int seconds = 0;
  bool initFlag = false;
  final assetsAudioPlayer = AssetsAudioPlayer();
  final assetsAudioPlayer1 = AssetsAudioPlayer.withId('0');
  final assetsAudioPlayer2 = AssetsAudioPlayer.withId('1');
  final assetsAudioPlayer3 = AssetsAudioPlayer.withId('2');
  final assetsAudioPlayer4 = AssetsAudioPlayer.withId('3');

  Stopwatch stopwatch = Stopwatch();
  static const delay = Duration(microseconds: 1);

  /// for animation
  var begin = 0.0;
  Animation<double> heightSize;
  AnimationController _controller;

  /// Called each time the time is ticking
  void updateClock() {
    print('--started--');
    var duration;
    if (statusFlag == 'Start') {
      duration = Duration(minutes: 0, seconds: 10);
    } else if (statusFlag == 'Restart') {
      duration = Duration(minutes: 0, seconds: 10);
    } else {
      duration = Duration(minutes: minutes, seconds: seconds);
    }

    if (stopwatch.elapsed.inMilliseconds == duration.inMilliseconds - 1000) {
      assetsAudioPlayer4.open(Audio("assets/sounds/long-beep-1s.wav"));
    }
    // else if (stopwatch.elapsed.inMilliseconds == duration.inMilliseconds - 5000) {
    //   beepSound("assets/sounds/long-beep-1s.mp3");
    // }

    // if time is up, stop the timer
    if (stopwatch.elapsed.inMilliseconds >= duration.inMilliseconds) {
      if (statusFlag == 'Start') {
        _restartCountDown();
        statusFlag = 'End';
        stopwatch.start();
        _controller.forward();
        SessionManager.setStopWatchState(true);
      } else if (statusFlag == 'Restart') {
        _restartCountDown();
        statusFlag = 'End';
        stopwatch.start();
        _controller.forward();
        SessionManager.setStopWatchState(true);
      } else {
        statusFlag = 'Start';
        showTitle = true;
        showButton = true;
        fontVal = 40;
        stopwatch.stop();
        stopwatch.reset();
        _controller.stop(canceled: false);
        SessionManager.setStopWatchState(false);
      }
      return;
    }
    var millisecondsRemaining;
    if (statusFlag == 'Start') {
      millisecondsRemaining =
          (duration.inMilliseconds + 1000) - stopwatch.elapsed.inMilliseconds;
    } else if (statusFlag == 'Restart') {
      millisecondsRemaining =
          (duration.inMilliseconds + 1000) - stopwatch.elapsed.inMilliseconds;
    } else {
      millisecondsRemaining = stopwatch.elapsed.inMilliseconds;
    }
    var minutesRemaining = ((millisecondsRemaining / (1000 * 60)) % 60).toInt();
    var secondsRemaining = ((millisecondsRemaining / 1000) % 60).toInt();
    if (showTitle) {
      if (!initFlag) {
        setState(() {
          fontVal = 16;
          timeText = '';
        });
      } else {
        setState(() {
          timeText = '${minutes.toString().padLeft(2, '0')}:'
              '${seconds.toString().padLeft(2, '0')}';
          fontVal = 85;
        });
      }
    } else {
      setState(() {
        fontVal = 85;
      });
      if (statusFlag == 'Start') {
        setState(() {
          timeText = '${secondsRemaining.toString()}';

          if (secondsRemaining == 4) {
            assetsAudioPlayer1.open(Audio("assets/sounds/short-beep-1s1.wav"));
          } else if (secondsRemaining == 3) {
            assetsAudioPlayer2.open(Audio("assets/sounds/short-beep-1s2.wav"));
          } else if (secondsRemaining == 2) {
            assetsAudioPlayer3.open(Audio("assets/sounds/short-beep-1s3.wav"));
          } else if (secondsRemaining == 1) {
            assetsAudioPlayer4.open(Audio("assets/sounds/long-beep-1s.wav"));
          }
        });
      } else if (statusFlag == 'Restart') {
        setState(() {
          timeText = '${secondsRemaining.toString()}';

          if (secondsRemaining == 4) {
            assetsAudioPlayer1.open(Audio("assets/sounds/short-beep-1s1.wav"));
          } else if (secondsRemaining == 3) {
            assetsAudioPlayer2.open(Audio("assets/sounds/short-beep-1s2.wav"));
          } else if (secondsRemaining == 2) {
            assetsAudioPlayer3.open(Audio("assets/sounds/short-beep-1s3.wav"));
          } else if (secondsRemaining == 1) {
            assetsAudioPlayer4.open(Audio("assets/sounds/long-beep-1s.wav"));
          }
        });
      } else {
        setState(() {
          timeText = '${minutesRemaining.toString().padLeft(2, '0')}:'
              '${secondsRemaining.toString().padLeft(2, '0')}';
        });
      }
    }
    if (stopwatch.isRunning) {
      setState(() {
        buttonText = "Running";
      });
    } else if (stopwatch.elapsed.inSeconds == 0) {
      if (showButton) {
        setState(() {
          buttonText = "Start";
        });
        showButton = false;
      }
    } else {
      setState(() {
        buttonText = "Paused";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    final duration = Duration(days: 0, minutes: minutes, seconds: seconds);
    _controller = AnimationController(
      duration: duration,
      vsync: this,
    );

    timer = Timer.periodic(delay, (Timer t) => updateClock());

    // audioCache.load('sounds/short-beep-1s.mp3');
  }

  @override
  void dispose() {
    _controller.dispose();
    stopwatch.stop();
    timer.cancel();
    SessionManager.setStopWatchState(false);
    super.dispose();
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        OutlineButton(
          shape: RoundedRectangleBorder(
            //borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Color(0xff333333))
          ),
          child: Text(
            "No",
            style: GoogleFonts.rubik(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xff333333)),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(width: 20),
        FlatButton(
          color: Colors.blue,//Color(0xff1A7998),
          child: Text(
            "Si",
            style: GoogleFonts.rubik(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xffFFFFFF)),
          ),
          onPressed: () {
            _restartCountDown();
            setState(() {
              statusFlag = 'Start';
              buttonText = 'Start';
              showTitle = true;
              initFlag = false;
            });
            Navigator.pop(context);
          },
        ),
      ],
    );
    // set up the AlertDialog
    AlertDialog notes = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      contentPadding: EdgeInsets.all(15.0),
      titlePadding: EdgeInsets.all(15.0),
      content: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: '¿Estás seguro que deseas reiniciar?',
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

  void _restartCountDown() {
    begin = 0.0;
    _controller.reset();
    stopwatch.stop();
    stopwatch.reset();
  }

  Widget _toggleWidget() {
    if (buttonText == 'Start') {
      return (_startButton());
    } else if (buttonText == 'Paused') {
      return (_buttonGroup());
    } else {
      return (_pauseButton());
    }
  }

  Widget _buttonGroup() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {
            if (!stopwatch.isRunning) {
              stopwatch.start();
              _controller.forward();
              SessionManager.setStopWatchState(true);
            }
            showTitle = false;
            updateClock();
          },
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Iniciar',
                  style: GoogleFonts.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFFFFF)))),
          backgroundColor: Color(0xff0f9956),
        ),
        SizedBox(width: 20),
        FloatingActionButton(
          onPressed: () {
            //if (stopwatch.isRunning) {
            // print('--Paused--');
            //  stopwatch.stop();
            //   _controller.stop(canceled: false);
            // } else {
            //   print('--Running--');
            //  stopwatch.start();
            //  _controller.forward();
            // }
            //  showTitle= false;
            //  updateClock();
            showAlertDialog(context);
          },
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Reiniciar',
                  style: GoogleFonts.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFFFFF)))),
          backgroundColor: Color(0xff888885),
        )
      ],
    );
  }

  Widget _pauseButton() {
    return FloatingActionButton(
      onPressed: () {
        if (stopwatch.isRunning) {
          print('--Paused--');
          stopwatch.stop();
          _controller.stop(canceled: false);
          SessionManager.setStopWatchState(false);
        }
        showTitle = false;
        updateClock();
      },
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Pausar',
              style: GoogleFonts.rubik(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFFFFFF)))),
      backgroundColor: Color(0xff904444),
    );
  }

  Widget _startButton() {
    return FloatingActionButton(
      onPressed: () {
        if (!stopwatch.isRunning) {
          stopwatch.start();
          _controller.forward();
          SessionManager.setStopWatchState(true);
        }
        showTitle = false;
        updateClock();
        setState(() {
          initFlag = true;
        });
      },
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Iniciar',
              style: GoogleFonts.rubik(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFFFFFF)))),
      backgroundColor: Color(0xff0f9956),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 230,
        decoration: BoxDecoration(color: Color(0xff333333)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            !initFlag
                ? buttonText == 'Start'
                    ? Container(
                        padding: EdgeInsets.only(top: 0),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: 'Iniciar Calentamiento.',
                                style: GoogleFonts.rubik(
                                    fontSize: fontVal,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFFFFFF)))))
                    : Container()
                : buttonText == 'Start'
                    ? Container(
                        padding: EdgeInsets.only(top: 0),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text:
                                    '${minutes.toString().padLeft(2, '0')} minutos completados',
                                style: GoogleFonts.rubik(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFFFFFF)))))
                    : Container(),
            Container(
                padding: EdgeInsets.only(top: 0),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: timeText,
                        style: GoogleFonts.rubik(
                            fontSize: fontVal,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF))))),
            SizedBox(height: 10),
            _toggleWidget(),
          ],
        ));
  }
}
