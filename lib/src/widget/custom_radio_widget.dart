import 'package:flutter/material.dart';

class CustomRadioWidget<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final double width;
  final double height;

  CustomRadioWidget({this.value, this.groupValue, this.onChanged, this.width = 32, this.height = 32});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          onChanged(this.value);
        },
        child: Container(
          height: this.height,
          width: this.width,
          decoration: ShapeDecoration(
            shape: CircleBorder(),
            gradient: LinearGradient(
              colors: [
                Colors.grey,//Color(0xFF49EF3E),
                Colors.grey,//Color(0xFF06D89A),
              ],
            ),
          ),
          child: Center(
            child: Container(
              height: this.height - 5,
              width: this.width - 5,
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                ),
              ),
              child: Center(
                child: Container(
                  height: this.height - 12,
                  width: this.width - 12,
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),

                    gradient: LinearGradient(
                      colors: value == groupValue ? [
                        Colors.grey,//Color(0xFFE13684),
                        Colors.grey,//Color(0xFFFF6EEC),
                      ] : [
                        Theme.of(context).scaffoldBackgroundColor,
                        Theme.of(context).scaffoldBackgroundColor,
                      ],
                    ),
                  ),
                  //child
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}