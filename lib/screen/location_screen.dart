import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/authentication/FirebaseService.dart';
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

  FirebaseService _service = FirebaseService();
  late bool loading = false;
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  late String countryValue = "";
  late String stateValue = "";
  late String cityValue = "";
  late String address = "";

  /* Future getFuture() {
    return Future(() async {
      await Future.delayed(Duration(seconds: 5));
      return 'Hello, Future Progress Dialog!';
    });
  } */

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
    showBottomscreen(context) {
      getLocation().then(
        (location) {
          if (location != null) {
            showModalBottomSheet(
                isScrollControlled: true,
                enableDrag: true,
                context: context,
                builder: (context) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 26,
                      ),
                      AppBar(
                        automaticallyImplyLeading: false,
                        iconTheme: IconThemeData(color: Colors.black),
                        elevation: 1,
                        backgroundColor: Colors.white,
                        title: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.clear),
                            ), // IconButton
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Location',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ), //Row
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(6),
                              ), // BoxDecoration
                              child: SizedBox(
                                  height: 48,
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                    hintText:
                                        'search city, area or neighbourhood',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    icon: Icon(Icons.search),
                                  ))))),
                      ListTile(
                        onTap: () {},
                        horizontalTitleGap: 0.0,
                        leading: Icon(
                          Icons.my_location,
                          color: Colors.blue,
                        ), // Icon
                        title: Text(
                          'Use current location',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ), // Text
                        subtitle: Text(
                          location == null ? 'Fetching location' : 'address',
                          style: TextStyle(fontSize: 12),
                        ),
                      ), // Listrile
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey.shade300,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, bottom: 4, top: 4),
                          child: Text(
                            'CHOOSE CITY',
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 12),
                          ), //text
                        ), //padding
                      ), // Container
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: CSCPicker(
                          layout: Layout.vertical,
                          dropdownDecoration:
                              BoxDecoration(shape: BoxShape.rectangle),
                          defaultCountry: DefaultCountry.India,
                          onCountryChanged: (value) {
                            setState(() {
                              countryValue = value;
                            });
                          },
                          onStateChanged: (value) {
                            setState(() {
                              stateValue = value!;
                            });
                          },
                          onCityChanged: (value) {
                            setState(() {
                              cityValue = value!;
                              address =
                                  '$cityValue, $stateValue, ${countryValue.substring(0)}';
                            });
                            _service.updateUser({}, context).then(((value) {
                              Navigator.pushNamed(context, Home.id);
                            }));
                          },
                        ),
                      )
                    ],
                  );
                });
          }
        },
      );

      showModalBottomSheet(
          isScrollControlled: true,
          enableDrag: true,
          context: context,
          builder: (context) {
            return Column(
              children: [
                SizedBox(
                  height: 26,
                ),
                AppBar(
                  automaticallyImplyLeading: false,
                  iconTheme: IconThemeData(color: Colors.black),
                  elevation: 1,
                  backgroundColor: Colors.white,
                  title: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.clear),
                      ), // IconButton
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Location',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ), //Row
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(6),
                        ), // BoxDecoration
                        child: SizedBox(
                            height: 48,
                            child: TextFormField(
                                decoration: InputDecoration(
                              hintText: 'search city, area or neighbourhood',
                              hintStyle: TextStyle(color: Colors.grey),
                              icon: Icon(Icons.search),
                            ))))),
                ListTile(
                  onTap: () {},
                  horizontalTitleGap: 0.0,
                  leading: Icon(
                    Icons.my_location,
                    color: Colors.blue,
                  ), // Icon
                  title: Text(
                    'Use current location',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ), // Text
                  subtitle: Text(
                    'Enable location',
                    style: TextStyle(fontSize: 12),
                  ),
                ), // Listrile
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 4, top: 4),
                    child: Text(
                      'CHOOSE CITY',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 12),
                    ), //text
                  ), //padding
                ), // Container
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: CSCPicker(
                    layout: Layout.vertical,
                    dropdownDecoration:
                        BoxDecoration(shape: BoxShape.rectangle),
                    defaultCountry: DefaultCountry.India,
                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value;
                      });
                    },
                    onStateChanged: (value) {
                      setState(() {
                        stateValue = value!;
                      });
                    },
                    onCityChanged: (value) {
                      setState(() {
                        cityValue = value!;
                        address =
                            '$cityValue, $stateValue, ${countryValue.substring(0)}';
                      });
                      print(address);
                    },
                  ),
                )
              ],
            );
          });
    }

    /* showDialog(
      context: context,
      builder: (context) =>
          FutureProgressDialog(getFuture(), message: Text('Loading...')),
    ); */

    return Scaffold(
        body: Column(
      children: [
        Image.asset('assets/images/location.jpg'),
        SizedBox(
          height: 20,
        ),
        Text(
          'Where do you want \nto buy/sell products?',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
          onPressed: () {
            showBottomscreen(context);
          },
          child: Text(
            'Set Location Manually',
          ),
        ),
      ],
    ));
  }
}
