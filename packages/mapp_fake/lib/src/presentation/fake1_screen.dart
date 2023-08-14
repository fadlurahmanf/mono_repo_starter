import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fake1Screen extends StatefulWidget {
  const Fake1Screen({super.key});

  @override
  State<Fake1Screen> createState() => _Fake1ScreenState();
}

class _Fake1ScreenState extends State<Fake1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Column(
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
          ],
        ),),
      ),
    );
  }
}
