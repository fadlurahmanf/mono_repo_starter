import 'package:core_config/config.dart';
import 'package:flutter/material.dart';
import 'package:mapp_onboarding/mapp_onboarding.dart';
import 'package:mapp_onboarding/src/presentation/_index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapp_onboarding/src/presentation/splash/splash_bloc.dart';

class SplashScreen extends StatefulWidget with WrapperState {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  @override
  Widget wrap(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => context.get<SplashBloc>(),
      child: this,
    );
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      context.pushNamed('MappExampleRoute', 'ExampleScreen');
    });
    // context.read<SplashBloc>().add(const SplashEvent.generateGuestToken());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is GenerateGuestTokenSuccess) {
          context.pushReplaceAll(MappOnBoardingRoute, WelcomeScreen);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox.expand(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/setneg_logo.png',
                  height: 100,
                  width: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
