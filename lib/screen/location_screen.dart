import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screen/login.dart';
import 'package:location/location.dart';

import 'home.dart';

class LocationScreen extends StatefulWidget {
  static const String id = 'location-screen';

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Location location = new Location();
  late bool loading = false;
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  Future<LocationData?> getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();

    return _locationData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Image.asset('assets/images/tfc.jpg'),
        SizedBox(
          height: 20,
        ),
        Text(
          'Where do you want \nto buy/sell products',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: loading
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedButton.icon(
                        icon: Icon(CupertinoIcons.location_fill),
                        label: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Text('Around Me'),
                        ),
                        onPressed: () {
                          setState(() {
                            loading = true;
                          });

                          getLocation().then((value) {
                            if (value != null) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home(
                                            locationData: _locationData,
                                          )));
                            }
                          });
                        },
                      ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Set Location Manually'),
        ),
      ],
    ));
  }
}
