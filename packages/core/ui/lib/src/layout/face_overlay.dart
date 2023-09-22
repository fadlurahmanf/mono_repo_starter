import 'package:flutter/material.dart';

class FaceClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width / 2, 250),
        radius: 180,
      ))
      ..addRect(Rect.fromLTWH(0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class FacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width / 2, 250),
        radius: 180,
      ))
      ..fillType = PathFillType.evenOdd;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0
      ..color = Colors.white;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class FaceOverlay extends StatefulWidget {
  const FaceOverlay({super.key});

  @override
  State<FaceOverlay> createState() => _FaceOverlayState();
}

class _FaceOverlayState extends State<FaceOverlay> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ClipPath(
        clipper: FaceClipper(),
        child: CustomPaint(
          painter: FacePainter(),
          child: Container(
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
