import 'package:flutter/material.dart';

class TNCScreen extends StatelessWidget {
  const TNCScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TNCLayout(
      key: key,
    );
  }
}

class _TNCLayout extends StatefulWidget {
  const _TNCLayout({Key? key}) : super(key: key);

  @override
  State<_TNCLayout> createState() => _TNCLayoutState();
}

class _TNCLayoutState extends State<_TNCLayout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
    );
  }
}
