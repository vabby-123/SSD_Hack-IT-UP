import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/flutter_catalog/pages/home_page.dart';
import 'package:flutter_application_2/screen/home.dart';
import 'package:flutter_application_2/screen/location_screen.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../../E Wallet/pages/home_page.dart';
import '../govt_scheme_carousel/govt_carousel.dart';
import '../payment/my_google_pay.dart';
import 'MyRoutes.dart';

class BSRFirstPage extends StatefulWidget {
  @override
  _BSRFirstPageState createState() => _BSRFirstPageState();
}

class _BSRFirstPageState extends State<BSRFirstPage> {
  final number = '*99#';
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 152, 0, 1),
          title: Text("SSD Saarthi"),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            sahayakPay(),
            shoppingCard(),
            secondHandCard(),
          ],
        ),
      );

  Widget sahayakPay() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1553729459-efe14ef6055d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW9uZXl8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePageEWallet()));
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'Buy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );

  Widget shoppingCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8b25saW5lJTIwc2hvcHBpbmd8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'Sell',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );

  Widget secondHandCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://www.trelleborg.com/wheels/-/media/tires-aft/products-and-solutions-images/radial-combine-harvesters/trelleborg-agricultural-tire-radial-combine-harvesters-1600.jpg?rev=11d39bfac716426ab7b48db09dda6032',
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LocationScreen()));
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'Rent',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
}
