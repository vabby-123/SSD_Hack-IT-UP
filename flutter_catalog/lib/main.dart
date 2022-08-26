import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/MyRoutes.dart';
import 'package:flutter_catalog/pages/firstPage.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/pages/signup.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        /* if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: SplashScreen(),
            debugShowCheckedModeBanner: false,
          );
        } else {*/
        return MaterialApp(
          color: Colors.transparent,
          //since if this is specified then,other class cannot be a firstmost class or screen.Only this will be the first screen
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: ThemeData(
            primarySwatch: Colors.green,
            fontFamily: GoogleFonts.lato().fontFamily,
            appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            primaryTextTheme: GoogleFonts.latoTextTheme(),
          ),
          //initialRoute: MyRoutes.loginRoute, //"/home",
          routes: {
            "/": (context) => AuthUi(), //LoginPage(),
            "/first": (context) => FirstPage(),
            "/home": (context) => HomePage(),
            "/login": (context) => LoginPage(),
          },
        );
        // }
      },
    );
  }
}
