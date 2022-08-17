import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/authentication/phone_auth.dart';
import 'package:flutter_application_2/screen/login.dart';

import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart';
import 'package:location/location.dart';

class Home extends StatefulWidget {
  //stateful widget for setting state
  static const String id = "home";

  late final LocationData locationData;

  Home({Key? key, required this.locationData}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // add required and {} else shows error in main.dart

  late String addresses = '';

  Future<String> getAddress() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        widget.locationData.latitude!, widget.locationData.longitude!);

    String first = placemarks[0].locality.toString();

    setState(() {
      addresses = first;
    });
    print(addresses);

    return addresses;
  }

  @override
  void initState() {
    getAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: Row(
          children: [
            Icon(CupertinoIcons.location_solid, color: Colors.black, size: 18),
            Text(
              addresses,
              style: TextStyle(color: Colors.black),
            ),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Colors.black,
            )
          ],
        ), //widget.locationData.latitude.toString()),
      ),
      body: TextButton(
        onPressed: () {
          FirebaseAuth.instance.signOut().then((value) {
            Navigator.pushNamed(context, AuthUi.id);
          });
        },
        child: Text('Log Out'),
      ),
    );
  }
}
