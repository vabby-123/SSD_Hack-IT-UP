import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/govt_scheme_carousel/govt_carousel.dart';
import 'package:flutter_catalog/payment/my_google_pay.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'MyRoutes.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final number = '+919648427794';
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 152, 0, 1),
          title: Text("Sarthi: SSD"),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildImageInteractionCard(),
            shoppingCard(),
            schemeCard(),
            secondHandCard(),
          ],
        ),
      );

  /* Widget buildRoundedCard() => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rounded card',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'This card is rounded',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ); */

  /* Widget buildColoredCard() => Card(
        shadowColor: Colors.red,
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.redAccent, Colors.red],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Colored card',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'This card is rounded and has a gradient',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ); */
  Widget buildImageInteractionCard() => Card(
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
              child: Text(
                'This facility works only if you have net banking available in your no. If not then please contact on this no- 12345678',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                FlatButton(
                  child: Text('Online'),
                  onPressed: () {
                    //Navigator.push(context,
                    //  MaterialPageRoute(builder: (context) => MyGooglePay()));
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
              'Shopping',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
  Widget schemeCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1583407386527-820c9281cfd0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHJhc2h0cmFwYXRpJTIwYmhhdmFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
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
            Text(
              'Latest Government Schemes',
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
                'https://images.unsplash.com/photo-1583407386527-820c9281cfd0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHJhc2h0cmFwYXRpJTIwYmhhdmFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
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
            Text(
              'Rental Items',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );

  //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
  /* body: new Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Card(
                  color: Color.fromARGB(255, 255, 141, 34),
                  margin: EdgeInsets.only(top: 30),
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage())),
                    },
                    child: new Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 50.0, horizontal: 55.0),
                      child: new Column(
                        children: <Widget>[
                          new Text('पैसे भेजे'),
                        ],
                      ),
                    ),
                  ),
                ),
                new Card(
                  color: Color.fromARGB(255, 255, 141, 34),
                  margin: EdgeInsets.only(top: 30),
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyGooglePay())),
                    },
                    child: new Container(
                      padding: new EdgeInsets.all(50.0),
                      child: new Column(
                        children: <Widget>[
                          new Text('सामान बेचे'),
                        ],
                      ),
                    ),
                  ),
                ),
                new Card(
                  color: Color.fromARGB(255, 255, 141, 34),
                  margin: EdgeInsets.only(top: 30),
                  child: new Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 30.0, horizontal: 50.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('महत्वपूर्ण'),
                        new Text('सरकारी'),
                        new Text('परियोजना'),
                      ],
                    ),
                  ),
                ),
                new Card(
                  margin: EdgeInsets.only(top: 30),
                  child: new Container(
                    padding: new EdgeInsets.all(50.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('abc'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),*/

}
