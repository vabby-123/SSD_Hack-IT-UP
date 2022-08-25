import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_indicator/carousel_indicator.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class GovernmentSchemes extends StatefulWidget {
  @override
  _GovernmentSchemesState createState() => _GovernmentSchemesState();
}

class _GovernmentSchemesState extends State<GovernmentSchemes> {
  int pageIndex = 0;
  final List<String> images = [
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-78ec0.appspot.com/o/govt_carousel%2FWhatsApp%20Image%202022-08-24%20at%209.08.13%20PM.jpeg?alt=media&token=c8344d3f-6cd2-4472-86bb-847ffca6981a',
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-78ec0.appspot.com/o/govt_carousel%2FWhatsApp%20Image%202022-08-24%20at%209.08.14%20PM.jpeg?alt=media&token=696e8d07-4dcd-4b2f-838c-a584cdd82736',
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-78ec0.appspot.com/o/govt_carousel%2FWhatsApp%20Image%202022-08-24%20at%209.08.23%20PM.jpeg?alt=media&token=f227a900-264f-4200-a417-7212d91c21d9',
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-78ec0.appspot.com/o/govt_carousel%2FWhatsApp%20Image%202022-08-24%20at%209.33.35%20PM.jpeg?alt=media&token=6a69012d-c69b-4b30-a6c7-10e32a6ae554',
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-78ec0.appspot.com/o/govt_carousel%2FWhatsApp%20Image%202022-08-24%20at%209.50.50%20PM.jpeg?alt=media&token=f07ef4fa-41bb-47e6-85e2-057342784d26',
  ];

  _launchURLApp() async {
    var url = Uri.parse("https://ssd-saarthi.github.io/SSD-Saarthi/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  /* @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }
 */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Builder(
              builder: (context) {
                final double height = MediaQuery.of(context).size.height;
                return CarouselSlider(
                  options: CarouselOptions(
                    height: 600,
                    viewportFraction: 0.99,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    aspectRatio: 3,
                    autoPlay: false,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        pageIndex = index;
                      });
                    },
                  ),
                  items: images
                      .map(
                        (item) => Scaffold(
                          body: Container(
                            child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Image.network(
                                    item,
                                    fit: BoxFit.fill,
                                    height: 700,
                                  ),
                                ]),

                            /*child: Center(
                              child: Image.network(
                                item,
                                fit: BoxFit.cover,
                                height: 500,
                              ),
                            ),*/

                            padding: EdgeInsets.only(
                                left: 5.0, top: 40.0, right: 0.0, bottom: 0.0),
                          ),
                          backgroundColor: Color.fromARGB(255, 241, 241, 241),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
          CarouselIndicator(
            count: images.length,
            index: pageIndex,
            color: Colors.black,
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: _launchURLApp,
            child: Text('Click to read more'),
          )
        ],
      ),
    );
  }
}
