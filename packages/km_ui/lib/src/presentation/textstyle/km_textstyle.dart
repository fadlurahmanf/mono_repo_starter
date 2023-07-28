import 'package:flutter/material.dart';
import 'package:km_ui/km_ui.dart';
import 'package:sizer/sizer.dart';

class KmTextStyle {
  KmTextStyle._();

  static const _default = 'LexendDeca';

  static TextStyle textButton() {
    return TextStyle(
      fontFamily: _default,
      fontWeight: FontWeight.w700,
      fontSize: 16.sp,
      color: Colors.white,
      height: 1.4,
    );
  }

  static TextStyle textFooter({
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: _default,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: (10.5).sp,
      color: color ?? Colors.black,
      height: 1.4,
    );
  }

  static TextStyle title({
    String fontFamily = _default,
    FontWeight weight = FontWeight.w700,
    Color color = KmColor.green,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: weight,
      fontSize: 30.sp,
      color: color,
    );
  }

  static TextStyle logo({
    FontWeight weight = FontWeight.w400,
    double height = 1.4,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: _default,
      fontWeight: weight,
      height: height,
      fontSize: 12.sp,
      color: KmColor.green,
      letterSpacing: letterSpacing,
      shadows: const [
        Shadow(
          offset: Offset(1.0, 3.0),
          blurRadius: 10.0,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        // Shadow(
        //   offset: Offset(1.0, 1.0),
        //   blurRadius: 10.0,
        //   color: Color.fromARGB(255, 0, 0, 0),
        // ),
      ]
    );
  }

  static TextStyle labelTextField({
    double height = 1.4,
    Color? color,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: _default,
      fontWeight: FontWeight.w400,
      height: height,
      fontSize: 11.sp,
      color: color ?? KmColor.green,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle hintTextField({
    double height = 1.4,
    Color? color,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: _default,
      fontWeight: FontWeight.w600,
      height: height,
      fontSize: 13.sp,
      color: Colors.grey,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle errorTextField({
    double height = 1.4,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: _default,
      fontWeight: FontWeight.w400,
      height: height,
      fontSize: 11.sp,
      color: Colors.red,
      letterSpacing: letterSpacing,
    );
  }
}
