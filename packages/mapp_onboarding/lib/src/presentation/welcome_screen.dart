import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapp_onboarding/src/mapp_onboarding_module.dart';
import 'package:mapp_onboarding/src/presentation/tnc_screen.dart';
import 'package:mapp_shared/mapp_shared.dart';
import 'package:mapp_storage/mapp_storage.dart';

class WelcomeScreen extends StatefulWidget with WrapperState {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();

  @override
  Widget wrap(BuildContext context) {
    return this;
  }
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // fake setneg
              SizedBox(height: MediaQuery.of(context).viewPadding.top,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/setneg_logo.png', height: 75, width: 75,),
                  Image.asset('assets/images/hut_ri.jpeg', height: 100, width: 100,),
                ],
              ),
              Image.asset('assets/images/garuda_logo.png', height: 75, width: 75,),
              SizedBox(height: 30,),
              Text('Presiden Republik Indonesia', style: GoogleFonts.greatVibes(
                fontSize: 30
              ), textAlign: TextAlign.center,),
              Text('bserta', style: GoogleFonts.montserrat(
                  fontSize: 18
              ), textAlign: TextAlign.center,),
              Text('ibu Hj. Iriana Joko Widodo', style: GoogleFonts.greatVibes(
                  fontSize: 25
              ), textAlign: TextAlign.center,),
              Text('mengharap kehadiran Saudara', style: GoogleFonts.montserrat(
                fontSize: 18
              ), textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              Text('Taufik Fadlurahman Fajari S.T.', style: GoogleFonts.greatVibes(
                  fontSize: 25
              ), textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Text('pada\nUpacara Peringatan HUT Ke-78\nProklamasi Kemerdekaan Republik Indonesia\nHari Kamis, 17 Agustus 2023, pukul 08:00 WIB\ndi Halaman Istana Merdeka', style: GoogleFonts.montserrat(
                  fontSize: 18
              ), textAlign: TextAlign.center,),
              // Text(MappConstant.helloWorld.tr),
              // ElevatedButton(
              //   onPressed: () async {
              //     context.getIt.get<LocalizationBloc>().add(const LocalizationEvent.setLanguage(locale: Locale('id', 'ID')));
              //   },
              //   child: const Text('GANTI KE INDONESIA'),
              // ),
              // ElevatedButton(
              //   onPressed: () async {
              //     context.getIt.get<LocalizationBloc>().add(const LocalizationEvent.setLanguage(locale: Locale('en', 'ID')));
              //   },
              //   child: const Text('GANTI KE ENGLISH'),
              // ),
              // ElevatedButton(
              //   onPressed: () async {
              //     context.push(MappOnBoardingRoutes, TNCScreen, transition: Transition.leftToRight);
              //   },
              //   child: const Text("PUSH TO TNC"),
              // ),
              // ElevatedButton(
              //   onPressed: () async {
              //     // await context.getIt.get<MappSqfliteRepository>().insert(
              //     //     mappEntity: const MappEntity(
              //     //       deviceId: 'DEVICE_ID',
              //     //     ));
              //   },
              //   child: const Text("INSERT"),
              // ),
              // ElevatedButton(
              //   onPressed: () async {
              //     // final list = await context.getIt.get<MappSqfliteRepository>().getAll();
              //     // for (var element in list) {
              //     //   print("masuk element: ${element.toJson()}");
              //     // }
              //   },
              //   child: const Text("GET"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
