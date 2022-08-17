import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_2/authentication/phoneauth_service.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:sn_progress_dialog/completed.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class PhoneAuthScreen extends StatefulWidget {
  static const String id = 'phone-auth-screen';

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  var countryCodeController = TextEditingController(text: '+91');
  var phoneNumberController = TextEditingController();

  String counterText = '0';

  bool validate = false;
  Future getFuture() {
    return Future(() async {
      await Future.delayed(Duration(seconds: 5));
      return 'Hello, Future Progress Dialog!';
    });
  }

  /*showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(
            width: 8,
          ),
          Text('Please Wait'),
        ],
      ),
    ); 

    showDialog(
        barrierDismissible:
            false, // background me tap karne se affect nahi padega and circular progress indicator nahi hatega
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  } */

  PhoneAuthService _service = PhoneAuthService();

  /* @override
  void dispose() {
    showAlertDialog(context); //it will close alert dialog, please wait..
    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    ProgressDialog pd = ProgressDialog(
      context: context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
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
                'Enter your Phone',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'We will send confirmation code to your phone',
                style: TextStyle(color: Colors.grey),
              ),
              Row(
                children: [
                  // expanded() or sized box() should be used in row() to avoid layout constraints
                  Expanded(
                    flex: 1, //25%
                    child: TextFormField(
                      autofocus: true,
                      controller: countryCodeController,
                      enabled: false,
                      decoration: InputDecoration(
                          counterText:
                              '10', //to shift the padding of  this form field upwards
                          labelText: 'Country'),
                    ),
                  ),

                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 3, //75%
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 10) {
                          setState(() {
                            validate = true;
                          });
                        } else {
                          validate = false;
                        }
                      },

                      maxLength: 10, //no of max digits 10  same as counter text
                      autofocus: true,
                      keyboardType: TextInputType.phone,
                      controller: phoneNumberController,
                      /* onChanged: (value) {
                        setState(() {
                          counterText = value.length.toString();
                        });
                      }, */
                      decoration: InputDecoration(
                          // counterText: '$counterText/10',
                          labelText: 'Number',
                          hintText: 'Enter your Phone Number'),
                    ),
                  ),
                ],
              )
            ]),
      ),
      bottomNavigationBar: SafeArea(
        child: AbsorbPointer(
          absorbing: validate == true ? false : true,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: validate == true
                    ? MaterialStateProperty.all(Colors.cyan)
                    : MaterialStateProperty.all(Colors.grey)),
            child: Text('Next'),
            onPressed: () {
              String number =
                  '${countryCodeController.text}${phoneNumberController.text}';
              //showAlertDialog(context);
              showDialog(
                context: context,
                builder: (context) => FutureProgressDialog(getFuture(),
                    message: Text('Loading...')),
              );
              print('hello');

              _service.verifyPhoneNumber(context, number);
            },
          ),
        ),
      ),
    );
  }
}
