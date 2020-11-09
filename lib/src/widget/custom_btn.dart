import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double height;
  final bool isDisabled;
  final double fontSize;
  final double radius;
  final EdgeInsets margin;
  final bool loading;
  final Color backColor;
  final Color fontColor;
  final bool borderFlag;
  final Alignment fontAlignment;
  CustomBtn({
    @required this.onPressed,
    @required this.text,
    this.loading = false,
    this.margin = const EdgeInsets.all(0),
    this.radius = 3.0,
    this.fontSize = 20,
    this.isDisabled = false,
    this.height = 48,
    this.backColor = Colors.white,
    this.fontColor = Colors.black,
    this.borderFlag = false, 
    this.fontAlignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        // alignment: Alignment.centerRight,
        child: Opacity(
          opacity: isDisabled ? 0.3 : 1.0,
          child: Card(
            margin: margin,
            color: backColor, //BigtabyAppTheme.of(context).secondaryColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    //color: borderFlag ? Colors.grey : Colors.transparent),
                    color: borderFlag ? Colors.white : Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(radius))),
            elevation: 0,
            child: InkWell(
                onTap: () {
                  if (isDisabled || loading) {
                    return;
                  }
                  onPressed();
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Align(
                    alignment: fontAlignment,
                    child: loading
                        ? CupertinoActivityIndicator()
                        : Text(text,
                            style: TextStyle(
                                fontSize: fontSize,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.normal,
                                color: fontColor)),
                  ),
                )),
          ),
        ));
  }
}
