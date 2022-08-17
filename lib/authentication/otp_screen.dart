import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/authentication/phone_auth.dart';
import 'package:flutter_application_2/authentication/phoneauth_service.dart';
import 'package:flutter_application_2/screen/location_screen.dart';

class OTPScreen extends StatefulWidget {
  final String number, verId;
  const OTPScreen({required this.number, required this.verId});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  PhoneAuthService _services = PhoneAuthService();

  var text1 = TextEditingController();
  var text2 = TextEditingController();
  var text3 = TextEditingController();
  var text4 = TextEditingController();
  var text5 = TextEditingController();
  var text6 = TextEditingController();

  bool loading = false;
  late String error = "";

  Future<void> phoneCredential(BuildContext context, String otp) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verId, smsCode: otp);

      //need of otp validation
      final User? user = (await _auth.signInWithCredential(credential)).user;
      if (user != null) {
        _services.addUser(context, user.uid);
        /*    Navigator.pushReplacementNamed(
            context, LocationScreen.id); //go to next screen */
      } else {
        print('Login Failed');

        if (mounted) {
          setState(() {
            error = 'Login Failed';
          });
        }
      }
    } catch (e) {
      print(e.toString());
      // error = 'Invalid OTP';

      if (mounted) {
        setState(() {
          error = 'Invalid OTP';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        automaticallyImplyLeading: false, //to remove back screen
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              //mainAxisAlignment:
              //  MainAxisAlignment.center, //column wise or top-bottom

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.red.shade200,
                  child: Icon(
                    CupertinoIcons.person_alt_circle,
                    color: Colors.red,
                    size: 60,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    // expanded() or sized box() should be used in row() to avoid layout constraints
                    Expanded(
                      child: RichText(
                          text: TextSpan(
                              text: 'We sent a 6 digit code to ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                              children: [
                            TextSpan(
                              text: widget.number,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 12),
                            )
                          ])),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(
                            context); //go back to previous screen or use push for clear phone number column
                      },
                      child: Icon(Icons.edit),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  // 1 row me otp ke 6 box
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: text1,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          if (value.length == 1) {
                            node.nextFocus();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: text2,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          //box me convert krne ke liye
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          if (value.length == 1) {
                            node.nextFocus();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: text3,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          if (value.length == 1) {
                            node.nextFocus();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: text4,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          if (value.length == 1) {
                            node.nextFocus();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: text5,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          if (value.length == 1) {
                            node.nextFocus();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: text6,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          if (value.length == 1) {
                            if (text1.text.length == 1) {
                              if (text2.text.length == 1) {
                                if (text3.text.length == 1) {
                                  if (text4.text.length == 1) {
                                    if (text5.text.length == 1) {
                                      String _otp =
                                          '${text1.text}${text2.text}${text3.text}${text4.text}${text5.text}${text6.text}';
                                      setState(() {
                                        loading = true;
                                      });
//login
                                      phoneCredential(context, _otp);
                                    }
                                  }
                                }
                              }
                            }
                          } else {
                            setState(() {
                              loading = false;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                if (loading)
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 50,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 28,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 20),
                )
              ])),
    );
  }
}
