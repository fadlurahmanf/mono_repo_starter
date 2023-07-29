import 'package:flutter/material.dart';
import 'package:km_ui/km_ui.dart';

class KmBaseVibrance extends StatelessWidget {
  final Widget child;
  const KmBaseVibrance({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(KmAssetConstant.backgroundVibrance), fit: BoxFit.cover)
              ),
            ),
          ),
          child
        ],
      ),
    );
  }
}
