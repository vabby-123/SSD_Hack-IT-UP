import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/authentication/authentication.dart';
import 'package:flutter_application_2/authentication/email_auth.dart';
import 'package:flutter_application_2/flutter_catalog/pages/firstPage.dart';
import 'package:flutter_application_2/image%20Upload/imgUpload.dart';
import 'package:flutter_application_2/screen/category_list.dart';
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
    return MaterialApp(
      //home: AuthUi(),
      initialRoute: Splash.id,
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.id: (context) => Splash(),
        AuthUi.id: (context) => AuthUi(),
        PhoneAuthScreen.id: (context) => PhoneAuthScreen(),
        FirstPage.id: (context) => FirstPage(),
        LocationScreen.id: (context) => LocationScreen(),
        EmailAuthScreen.id: (context) => EmailAuthScreen(),
        ImageUpload.id: (context) => ImageUpload(),
        CategoryListScreen.id: (context) => CategoryListScreen(),
      },
    );
  }
}
