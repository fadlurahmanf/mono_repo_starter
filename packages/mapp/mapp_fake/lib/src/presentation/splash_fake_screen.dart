import 'package:flutter/material.dart';

class SplashFakeScreen extends StatefulWidget {
  const SplashFakeScreen({super.key});

  @override
  State<SplashFakeScreen> createState() => _SplashFakeScreenState();
}

class _SplashFakeScreenState extends State<SplashFakeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/setneg_logo.png', height: 100, width: 100,),
              SizedBox(height: 20,),
              Text('Kementerian Sekretariat Negara Republik Indonesia', style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 18
              ), textAlign: TextAlign.center,),
              SizedBox(height: 40,),
              Text('Jangan bagikan kepada siapapun, properti milik pemerintah', style: TextStyle(
                  fontWeight: FontWeight.w400, fontSize: 18, fontStyle: FontStyle.normal
              ), textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              Text('Do not share this credential into anyone, government property', style: TextStyle(
                  fontWeight: FontWeight.w400, fontSize: 18, fontStyle: FontStyle.italic
              ), textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }
}
