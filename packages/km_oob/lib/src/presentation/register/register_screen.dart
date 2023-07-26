import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _RegisterLayout(
      key: key,
    );
  }
}

class _RegisterLayout extends StatefulWidget {
  const _RegisterLayout({super.key});

  @override
  State<_RegisterLayout> createState() => _RegisterLayoutState();
}

class _RegisterLayoutState extends State<_RegisterLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(),
    );
  }
}
