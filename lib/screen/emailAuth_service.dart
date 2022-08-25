import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/flutter_catalog/pages/firstPage.dart';
import 'package:flutter_application_2/screen/location_screen.dart';

class EmailAuthentication {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<DocumentSnapshot> getAdminCredential(
      {email, password, isLog, context}) async {
    DocumentSnapshot _result = await users.doc(email).get();

    if (isLog) {
      emailLogin(email, password, context);
    } else {
      if (_result.exists) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('An account already exists with this email'),
        ));
      } else {
        emailRegister(email, password, context);
      }
    }

    return _result;
  }

  emailLogin(email, password, context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('No user found')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Wrong password.'),
          ),
        );
      }
    }
  }

  emailRegister(email, password, context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user!.uid != null) {
        //register success, add user details to firebase
        return users.doc(userCredential.user?.email).set({
          'email': userCredential.user!.email,
          'mobile': null,
          'uid': userCredential.user!.uid,
        }).then((value) {
          Navigator.pushReplacementNamed(context, FirstPage.id);
        }).catchError((onError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to add user'),
            ),
          );
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password is too weak')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('account already exists'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error occured'),
        ),
      );
    }
  }
}
