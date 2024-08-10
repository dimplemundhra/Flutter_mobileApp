import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shopping1_app/Userpage/home/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping1_app/Userpage/home/loginpage.dart';
import 'package:shopping1_app/Userpage/home/signuppage.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Color.fromARGB(255, 54, 13, 116),
      splash: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 120)),
          Image.asset(
            "assets/images/AFlogo.png",
          ),

          /* Text("Amore Fashion",
              style: GoogleFonts.pinyonScript(
                  fontSize: 50, color: Color.fromARGB(255, 208, 210, 236))), */
        ],
      ),
      //backgroundColor: Color.fromARGB(255, 236, 237, 249),
      nextScreen: LoginPage(),
      splashIconSize: 500,
      duration: 5000,
      splashTransition: SplashTransition.slideTransition,
      animationDuration: const Duration(seconds: 2),
    );
  }
}
