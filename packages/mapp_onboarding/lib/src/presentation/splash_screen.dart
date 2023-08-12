import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapp_onboarding/mapp_onboarding.dart';
import 'package:mapp_onboarding/src/presentation/_index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 1), (){
      context.push(MappOnBoardingRoutes, WelcomeScreen, transition: Transition.leftToRight);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Text("TES TESSSSS SPLASH"),
        ],
      ),
    );
  }
}
