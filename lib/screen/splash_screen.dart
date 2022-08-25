import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/flutter_catalog/pages/firstPage.dart';
import 'package:flutter_application_2/screen/location_screen.dart';
import 'package:flutter_application_2/screen/login.dart';

class Splash extends StatefulWidget {
  static const String id = 'splash-screen';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(
        Duration(
          seconds: 3,
        ), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          //Not signed In
          Navigator.pushReplacementNamed(context, AuthUi.id);
        } else {
          //Signed In

          Navigator.pushReplacementNamed(context, FirstPage.id);
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Color.fromARGB(255, 247, 149, 38),
      Color.fromARGB(255, 33, 187, 33),
    ];
    const colorizeTextStyle = TextStyle(
      fontSize: 50.0,
      fontFamily: 'Horizon', // you can add your own font
    );

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 200,
            ),
            Image.asset(
              'assets/images/hack.png',
              width: 700,
              height: 400,
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 300.0,
              height: 50,
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Swayam Sahayata Digital',
                    textStyle: const TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                    colors: colorizeColors,
                  ),
                ],
                isRepeatingAnimation: true,
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
