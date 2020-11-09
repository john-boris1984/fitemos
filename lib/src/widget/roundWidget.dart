import 'dart:async';
import 'package:fitemos/src/utils/session_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class RoundWidget extends StatefulWidget {
  String timerWork;
  String timerRound;
  String timerRest;

  RoundWidget({Key key, this.timerWork, this.timerRound, this.timerRest})
      : super(key: key);

  @override
  _roundWidget createState() => _roundWidget();
}

class _roundWidget extends State<RoundWidget>
    with SingleTickerProviderStateMixin {
  Timer timer;
  String timeText = '';
  double fontVal = 0;
  String statusFlag = 'Start';
  String buttonText = 'Start';
  bool showButton = false;
  bool showTitle = true;
  int minutes = 0;
  int get round => int.parse(widget.timerRound);
  int roundIndex = 1;
  int get seconds => int.parse(widget.timerWork);
  int get restSeconds => int.parse(widget.timerRest);
  String timerWorkMinutes;
  String restMinutes;
  bool initFlag = false;
  bool workoutRestFlag = true;
  bool showDisplayFlag = false;

  Stopwatch stopwatch = Stopwatch();
  static const delay = Duration(microseconds: 1);
  final assetsAudioPlayer = AssetsAudioPlayer();
  final assetsAudioPlayer1 = AssetsAudioPlayer.withId('0');
  final assetsAudioPlayer2 = AssetsAudioPlayer.withId('1');
  final assetsAudioPlayer3 = AssetsAudioPlayer.withId('2');
  final assetsAudioPlayer4 = AssetsAudioPlayer.withId('3');

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
      if (workoutRestFlag) {
        duration = Duration(minutes: minutes, seconds: seconds);
      } else {
        duration = Duration(minutes: minutes, seconds: restSeconds);
      }
    }

    if (stopwatch.elapsed.inMilliseconds == duration.inMilliseconds - 2000) {
      assetsAudioPlayer4.open(Audio("assets/sounds/long-beep-1s.wav"));
    }

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
        if (roundIndex == round) {
          statusFlag = 'Start';
          showTitle = true;
          showButton = true;
          fontVal = 40;
          stopwatch.stop();
          stopwatch.reset();
          _controller.stop(canceled: false);
          SessionManager.setStopWatchState(false);
        } else {
          if (workoutRestFlag) {
            workoutRestFlag = false;
          } else {
            workoutRestFlag = true;
            setState(() {
              roundIndex = roundIndex + 1;
            });
          }
          _restartCountDown();
          statusFlag = 'End';
          stopwatch.start();
          _controller.forward();
          SessionManager.setStopWatchState(true);
        }
      }
      return;
    }
    var millisecondsRemaining =
        (duration.inMilliseconds + 1000) - stopwatch.elapsed.inMilliseconds;
    var minutesRemaining = ((millisecondsRemaining / (1000 * 60)) % 60).toInt();
    var secondsRemaining = ((millisecondsRemaining / 1000) % 60).toInt();
    if (showTitle) {
      if (!initFlag) {
        int totalSeconds = (restSeconds + seconds) * round;
        var showMinutes = (totalSeconds / 60).toInt();
        var showSeconds = (totalSeconds % 60).toInt();
        //print(showSeconds);
        setState(() {
          showDisplayFlag = false;
          fontVal = 16;
          timeText =
              'Tiempo Total: ${showMinutes.toString()}:${showSeconds.toString().padLeft(2, '0')} minutos.';
          if (seconds > 59)
            timerWorkMinutes =
                '${((seconds / 60).toInt()).toString()}:${((seconds % 60).toInt()).toString().padLeft(2, '0')} minuto';
          else
            timerWorkMinutes = '${seconds} segundos';
          if (restSeconds > 59)
            restMinutes =
                '${((restSeconds / 60).toInt()).toString()}:${((restSeconds % 60).toInt()).toString().padLeft(2, '0')} minuto';
          else
            restMinutes = '${restSeconds} segundos';
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
          showDisplayFlag = true;
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
      if (roundIndex == round) {
        if (showButton) {
          setState(() {
            showDisplayFlag = false;
            buttonText = "Start";
            roundIndex = 1;
            timeText = '';
          });
          showButton = false;
        }
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
  }

  @override
  void dispose() {
    _controller.dispose();
    stopwatch.stop();
    timer.cancel();
    super.dispose();
    SessionManager.setStopWatchState(false);
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
          color: Colors.blue, //Color(0xff1A7998),
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
              roundIndex = 1;
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
    SessionManager.setStopWatchState(false);
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

  Widget _timeDisplay() {
    return Container(
      child: Wrap(
        children: <Widget>[
          showDisplayFlag
              ? Stack(
                  children: <Widget>[
                    Container(
                      width: 96,
                      height: 104,
                    ),
                    Positioned(
                      right: 56,
                      top: 15,
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: '${roundIndex}',
                              style: GoogleFonts.rubik(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xffFFFFFF)))),
                    ),
                    Positioned(
                      left: 32,
                      bottom: 0,
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: '/',
                              style: GoogleFonts.rubik(
                                  fontSize: 70,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xffFFFFFF)))),
                    ),
                    Positioned(
                      left: 49,
                      top: 50,
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: '${round}',
                              style: GoogleFonts.rubik(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xffFFFFFF)))),
                    ),
                  ],
                )
              : SizedBox(width: 0.1),
          Container(
              padding: EdgeInsets.only(top: 0),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: timeText,
                      style: GoogleFonts.rubik(
                          fontSize: fontVal,
                          fontWeight: FontWeight.w900,
                          color: Color(0xffFFFFFF))))),
        ],
      ),
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
                        child: restSeconds != 0
                            ? RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text:
                                        'Completar ${round} rondas de:\n${timerWorkMinutes} de actividad.\n${restMinutes} de descanso entre rondas.',
                                    style: GoogleFonts.rubik(
                                        fontSize: fontVal,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xffFFFFFF))))
                            : RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text:
                                        'Completar ${round} rondas de:\n${timerWorkMinutes} de actividad.',
                                    style: GoogleFonts.rubik(
                                        fontSize: fontVal,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xffFFFFFF)))))
                    : Container()
                : buttonText == 'Start'
                    ? Container(
                        padding: EdgeInsets.only(top: 0),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: '${round} rounds completados',
                                style: GoogleFonts.rubik(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xffFFFFFF)))))
                    : Container(),
            _timeDisplay(),
            SizedBox(height: 10),
            _toggleWidget(),
          ],
        ));
  }
}
