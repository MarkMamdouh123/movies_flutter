import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:movies/home_screen.dart';

class Splash extends StatelessWidget {
  static const String routeName = "splash";
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AnimatedSplashScreen(
          splashIconSize: 250,
          duration: 1500,
          animationDuration: const Duration(seconds: 2),
          splashTransition: SplashTransition.scaleTransition,
          curve: Curves.fastOutSlowIn,
          backgroundColor: Colors.black,
          splash: Center(
            child: SizedBox(
              width: double.infinity,
              child: Image.asset("assets/splash_screen.png"),
            ),
          ),
          nextScreen: HomeScreen()),
    );
  }
}
