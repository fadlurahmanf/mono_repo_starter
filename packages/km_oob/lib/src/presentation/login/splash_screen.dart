import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:km_oob/src/presentation/register/register_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _SplashLayout(
      key: key,
    );
  }
}

class _SplashLayout extends StatefulWidget {
  const _SplashLayout({super.key});

  @override
  State<_SplashLayout> createState() => _SplashLayoutState();
}

class _SplashLayoutState extends State<_SplashLayout> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      context.push(RegisterScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.yellow,
    );
  }
}
