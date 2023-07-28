import 'package:flutter/material.dart';
import 'package:km_ui/km_ui.dart';

class KmFooter extends StatelessWidget {
  const KmFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(text: 'By clicking Register, you agree to our ', style: KmTextStyle.textFooter(
        fontWeight: FontWeight.w300
      )),
      TextSpan(
          text: 'Terms, Data Policy.',
          style: KmTextStyle.textFooter(color: KmColor.green, fontWeight: FontWeight.w600)),
    ]), textAlign: TextAlign.center,);
  }
}
