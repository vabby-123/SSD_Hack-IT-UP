import 'package:animated_text_kit/animated_text_kit.dart';
import "package:flutter/material.dart";
import "package:flutter_neumorphic/flutter_neumorphic.dart";

class Bannerwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .25,
        color: Colors.cyan,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'Tractors',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1,
                              fontSize: 20), // Textstyle
                        ), //text
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 45.0,
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ), // Textstyle
                            child: AnimatedTextKit(
                              repeatForever: true,
                              isRepeatingAnimation: true,
                              animatedTexts: [
                                FadeAnimatedText(
                                  'do 111',
                                  duration: Duration(seconds: 4),
                                ),
                                FadeAnimatedText(
                                  'do it RIGHT',
                                  duration: Duration(seconds: 4),
                                ),
                                FadeAnimatedText(
                                  'do it RIGHT NOW !!!',
                                  duration: Duration(seconds: 4),
                                ),
                              ],
                            ), //animatedTExt kit
                          ), //defaulttextstyle
                        ), //sizedbox
                      ],
                    ), //column
                    Neumorphic(
                      style: NeumorphicStyle(
                          color: Colors.white,
                          oppositeShadowLightSource: true), // Neumorphicstyle
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                              'https://firebasestorage.googleapis.com/v0/b/e-commerce-78ec0.appspot.com/o/banner%2Ficons8-car-48.png?alt=media&token=6c4e47e1-7ca4-4c5d-82d8-bca985c211b0') //check out the video from 21 min
                          ),
                    ) // Humorphic
                  ],
                ),
              ), // row padding
              Row(mainAxisSize: MainAxisSize.min, children: [
                Expanded(
                  child: NeumorphicButton(
                    onPressed: () {},
                    style: NeumorphicStyle(color: Colors.white),
                    child: Text(
                      'Rent Tractor ',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: NeumorphicButton(
                    onPressed: () {},
                    style: NeumorphicStyle(color: Colors.white),
                    child: Text(
                      'Give for Rent',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
