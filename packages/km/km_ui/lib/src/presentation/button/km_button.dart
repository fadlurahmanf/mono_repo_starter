// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:km_ui/km_ui.dart';
import 'package:sizer/sizer.dart';

class KmFilledButton extends StatelessWidget {
  bool _isExpand = false;
  bool _isWidget = false;
  bool _isText = false;
  late String _text;
  late Widget Function(BuildContext, TextStyle) _widget;
  VoidCallback onTap;

  KmFilledButton({required this.onTap, super.key});

  KmFilledButton.widget({
    required Widget Function(BuildContext, TextStyle) widget,
    bool? expand,
    required this.onTap,
    super.key,
  }) {
    _isExpand = expand ?? true;
    _isWidget = true;
    _isText = false;
  }

  KmFilledButton.text({
    required String text,
    bool? expand,
    required this.onTap,
    super.key,
  }) {
    _isExpand = expand ?? true;
    _isWidget = false;
    _isText = true;
    _text = text;
  }

  @override
  Widget build(BuildContext context) {
    return _isExpand
        ? SizedBox(
            width: double.infinity,
            child: _button(context),
          )
        : _button(context);
  }

  Widget _button(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(KmColor.green),
          foregroundColor: MaterialStateProperty.all<Color>(KmColor.green),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 7.sp)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      onPressed: onTap,
      child: _buttonChild(context),
    );
  }

  Widget _buttonChild(BuildContext context) {
    return _isWidget
        ? _widget(context, const TextStyle())
        : _isText
            ? Text(
                _text,
                style: KmTextStyle.textButton(),
              )
            : const SizedBox();
  }
}
