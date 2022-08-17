import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/authentication/authentication.dart';
import 'package:flutter_application_2/screen/home.dart';
import 'package:flutter_application_2/screen/location_screen.dart';
import 'package:flutter_application_2/screen/login.dart';
import 'package:flutter_application_2/screen/splash_screen.dart';

import 'authentication/phone_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*return FutureBuilder(
      future: Future.delayed(Duration(seconds: 4)),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash());
        } else { */
    return MaterialApp(
      //home: AuthUi(),
      initialRoute: Splash.id,
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.id: (context) => Splash(),
        AuthUi.id: (context) => AuthUi(),
        PhoneAuthScreen.id: (context) => PhoneAuthScreen(),
        LocationScreen.id: (context) => LocationScreen(),
      },

      /*Scaffold(
              body: Center(
                child: Text('App loaded'),
              ),
            ),*/
    );
    //}
    //},
    //);
  }
}
