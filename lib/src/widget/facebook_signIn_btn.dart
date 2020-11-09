import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/src/button.dart';

/// A sign in button that matches Facebook's design guidelines.
///
/// The button text can be overridden, however the default text is recommended
/// in order to be compliant with the design guidelines and to maximise
/// conversion.
class FacebookSignInBtn extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final double borderRadius;
  final Color splashColor;
  final bool centered;

  /// Creates a new button. The default button text is 'Continue with Facebook',
  /// which apparently results in higher conversion. 'Login with Facebook' is
  /// another suggestion.
  FacebookSignInBtn({
    this.onPressed,
    this.borderRadius = defaultBorderRadius,
    this.text = 'Continue with Facebook',
    this.textStyle,
    this.splashColor,
    this.centered = false,
    Key key,
  })  : assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StretchableButton(
      buttonColor: Colors.transparent,
      borderRadius: borderRadius,
      splashColor: splashColor,
      onPressed: onPressed,
      buttonPadding: 0.0,
      centered: centered,
      children: <Widget>[
        // Facebook doesn't provide strict sizes, so this is a good
        // estimate of their examples within documentation.
        Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Image(
              image: AssetImage(
                "graphics/flogo-HexRBG-Wht-100.png",
                package: "flutter_auth_buttons",
              ),
              height: 32.0,
              width: 32.0,
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(6.0, 8.0, 8.0, 8.0),
          child: Text(
            text,
            style: textStyle ??
                TextStyle(
                  // default to the application font-style
                  fontSize: 18.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500, //FontWeight.bold,
                  color: Colors.white,
                ),
          ),
        ),
      ],
    );
  }
}
