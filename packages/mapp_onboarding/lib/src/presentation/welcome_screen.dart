import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:mapp_onboarding/src/presentation/tnc_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _WelcomeLayout(
      key: key,
    );
  }
}

class _WelcomeLayout extends StatefulWidget {
  const _WelcomeLayout({Key? key}) : super(key: key);

  @override
  State<_WelcomeLayout> createState() => _WelcomeLayoutState();
}

class _WelcomeLayoutState extends State<_WelcomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                context.push(TNCScreen, transition: Transition.fadeIn);
              },
              child: Text("data"),
            )
          ],
        ),
      ),
    );
  }
}
