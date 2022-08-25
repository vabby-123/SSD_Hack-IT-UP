import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/authentication/otp_screen.dart';
import 'package:flutter_application_2/flutter_catalog/pages/firstPage.dart';
import 'package:flutter_application_2/screen/location_screen.dart';

class PhoneAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(context, uid) async {
    // add context in argument, else it will show error in Navigator context

    //check user data exists in firestore ya nahi

    final QuerySnapshot result =
        await users.where('uid', isEqualTo: user!.uid).get();
    List<DocumentSnapshot> document =
        result.docs; //list of user data (vaibhav, vaibhav2,---)

    if (document.length > 0) {
      //user data exists, so skip firestore
      Navigator.pushReplacementNamed(context, FirstPage.id);
    } else {
      return users.doc(user!.uid).set({
        'uid': user!.uid,
        'mobile': user!.phoneNumber,
        'email': user!.email
      }).then((value) //after add data to firebase, user will go to next screen
          {
        // if you push replacement name or push replacement, then you cant go back to previous screen
        Navigator.pushReplacementNamed(context, FirstPage.id);
      }).catchError((error) => print('Failed to add user: $error'));
    }
  }

  Future<void> verifyPhoneNumber(BuildContext context, number) async {
    final PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(
          credential); //sign in karo after verification is completed
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException e) {
      // if verification failed, it will show error
      if (e.code == 'invalid-phone-number') {
        print("invalid number");
      }
      print('The error is ${e.code}');
    };

    final PhoneCodeSent codeSent = (verificationId, forceResendingToken) async {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OTPScreen(
                    number: number,
                    verId: verificationId,
                  )));
    };

    try {
      auth.verifyPhoneNumber(
          phoneNumber: number,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          timeout: const Duration(seconds: 60),
          codeAutoRetrievalTimeout: (String verificationId) {
            print(verificationId);
          });
    } catch (e) {
      print('error ${e.toString()}');
    }
  }
}
