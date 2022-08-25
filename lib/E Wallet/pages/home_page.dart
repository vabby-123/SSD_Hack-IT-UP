// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/E%20Wallet/util/my_list-tile.dart';
import 'package:flutter_application_2/flutter_catalog/payment/my_google_pay.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../util/my_button.dart';
import '../util/my_card.dart';

class HomePageEWallet extends StatefulWidget {
  const HomePageEWallet({Key? key}) : super(key: key);

  @override
  State<HomePageEWallet> createState() => _HomePageEWalletState();
}

class _HomePageEWalletState extends State<HomePageEWallet> {
  final _controller = PageController();
  final number = '*99#';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromARGB(255, 32, 202, 32),
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Color.fromARGB(255, 32, 202, 32),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.currency_rupee,
                color: Color.fromARGB(255, 32, 202, 32),
              ))
        ]),
      ),
      body: SafeArea(
        child: Column(children: [
          // app bar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'SSD Pay',
                  style: TextStyle(
                    fontSize: 26,
                    color: Color.fromARGB(255, 250, 170, 21),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 4.0),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 250, 170, 21),
                    )),
              ],
            ),
          ),
          SizedBox(height: 10),

          Container(
            height: 198,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              children: [
                MyCard(
                  balance: 8950.20,
                  cardNumber: 123456789,
                  expiryMonth: 10,
                  expiryYear: 24,
                  color: Color.fromARGB(255, 250, 170, 21),
                ),
                MyCard(
                    balance: 5340.20,
                    cardNumber: 123456789,
                    expiryMonth: 12,
                    expiryYear: 23,
                    color: Colors.blue),
                MyCard(
                  balance: 3330.20,
                  cardNumber: 123456789,
                  expiryMonth: 12,
                  expiryYear: 25,
                  color: Colors.green[400],
                ),
              ],
            ),
          ),
          SizedBox(height: 24),

          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.grey.shade600,
            ),
          ),

          SizedBox(height: 24),

          Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                    iconImagePath: 'lib/E Wallet/icons/credit-card.png',
                    buttonText: 'Scan & Pay',
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyGooglePay()));
                    },
                    child: MyButton(
                      iconImagePath: 'lib/E Wallet/icons/save-money.png',
                      buttonText: 'Online Send',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      await FlutterPhoneDirectCaller.callNumber(number);
                    },
                    child: MyButton(
                      iconImagePath: 'lib/E Wallet/icons/save-money.png',
                      buttonText: 'Offline Send',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      FlutterPhoneDirectCaller.callNumber('14431');
                    },
                    child: MyButton(
                      iconImagePath: 'lib/E Wallet/icons/assistance.png',
                      buttonText: 'Send by Call',
                    ),
                  ),
                ],
              ),
            ),
          ]),
          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(children: [
              MyListTile(
                iconImagePath: 'lib/E Wallet/icons/transactions.png',
                tileTitle: 'History',
                tileSubtitle: 'Transactions Made',
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
