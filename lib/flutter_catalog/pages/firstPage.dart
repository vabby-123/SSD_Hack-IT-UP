import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/flutter_catalog/pages/Buy-Sell-Rent.dart';
import 'package:flutter_application_2/flutter_catalog/pages/home_page.dart';
import 'package:flutter_application_2/screen/home.dart';
import 'package:flutter_application_2/screen/location_screen.dart';
import 'package:flutter_application_2/screen/scanner.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../E Wallet/pages/home_page.dart';
import '../govt_scheme_carousel/govt_carousel.dart';
import '../payment/my_google_pay.dart';
import 'MyRoutes.dart';

class FirstPage extends StatefulWidget {
  static const String id = 'first_page';

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final number = '*99#';
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Image.asset(
            'assets/images/hack.png',
            width: 500,
          ),
          toolbarHeight: 100,
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            sahayakPay(),
            SizedBox(
              height: 16,
            ),
            secondHandCard(),
            SizedBox(
              height: 16,
            ),
            shoppingCard(),
            SizedBox(
              height: 16,
            ),
            schemeCard(),
            SizedBox(
              height: 16,
            ),
            schemeCard2(),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      );

  Widget sahayakPay() => Card(
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/e-commerce-78ec0.appspot.com/o/firstPage%2FGroup%201%20(1).png?alt=media&token=d6c9888d-b146-4c7f-95bf-46441da60294',
              ),
              width: 500,
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
          ],
        ),
      );
  /*Widget buildImageInteractionCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1553729459-efe14ef6055d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW9uZXl8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'Money Transfer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Column(children: [
                Text(
                  'This facility works only if you have net banking available in your no. If not then please contact on this no',
                  style: TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 270, top: 10),
                  child: InkWell(
                    child: Text(
                      '14431',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    onTap: () {
                      FlutterPhoneDirectCaller.callNumber('14431');
                    },
                  ),
                ),
              ]),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                FlatButton(
                  child: Text('Online'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePageEWallet()));
                  },
                ),
                FlatButton(
                  child: Text('Offline'),
                  onPressed: () async {
                    await FlutterPhoneDirectCaller.callNumber(number);
                  },
                )
              ],
            )
          ],
        ),
      );*/

  Widget secondHandCard() => Card(
        elevation: 16,
        shadowColor: Colors.black,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/e-commerce-78ec0.appspot.com/o/firstPage%2FGroup%202%20(1).png?alt=media&token=c4f022b4-9844-4d1b-855a-59efffd88ca8',
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
          ],
        ),
      );

  Widget shoppingCard() => Card(
        elevation: 16,
        shadowColor: Colors.black,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/e-commerce-78ec0.appspot.com/o/firstPage%2FGroup%203%20(1).png?alt=media&token=ca16ff60-bfc3-4ff8-937c-acdbfb721fd6',
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BSRFirstPage()));
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
          ],
        ),
      );
  Widget schemeCard() => Card(
        elevation: 16,
        shadowColor: Colors.black,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/e-commerce-78ec0.appspot.com/o/firstPage%2FGroup%204%20(1).png?alt=media&token=95b55ca1-5382-4743-a886-722370f1302d',
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GovernmentSchemes()));
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
          ],
        ),
      );
  Widget schemeCard2() => Card(
        elevation: 16,
        shadowColor: Colors.black,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/e-commerce-78ec0.appspot.com/o/firstPage%2FGroup%202%20(2).png?alt=media&token=8b144a60-ad13-4cb5-84b6-385c1d5d3796',
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Scanner()));
                },
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
          ],
        ),
      );
}
