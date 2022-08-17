import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/authentication/phone_auth.dart';
import 'package:flutter_application_2/authentication/phoneauth_service.dart';
import 'package:flutter_application_2/screen/location_screen.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '../authentication/authentication.dart';

class AuthUi extends StatelessWidget {
  static const String id = 'login-screen';
  @override
  Widget build(BuildContext context) {
    /* FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        // if already logged in, it will not ask again
        Navigator.pushReplacementNamed(context, LocationScreen.id);
      }
    }); */

    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 80,
          ),
          Container(child: Image(image: AssetImage("assets/images/tfc.jpg"))),
          SizedBox(
            height: 80,
          ),
          SizedBox(
            width: 200,
            height: 35,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PhoneAuthScreen.id);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.phone_android_outlined,
                    color: Colors.black,
                  ),
                  Text("Continue with Phone"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200,
            height: 35,
            child: SignInButton(
              Buttons.Google,
              text: ('Continue with Google'),
              onPressed: () async {
                User? user =
                    await Authentication.signInWithGoogle(context: context);
                if (user != null) {
                  PhoneAuthService _authentication = PhoneAuthService();
                  _authentication.addUser(context, user.uid);
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'OR',
              style: TextStyle(
                  color: Color.fromARGB(255, 36, 35, 35),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  decoration: TextDecoration.none),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Already have account? ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                    text: 'Login',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {}),
              ]),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'If you accept, you are following our terms and conditions *',
              style: TextStyle(fontSize: 12, decoration: TextDecoration.none),
            ),
          )
        ],
      ),
    );
  }
}
