import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/flutter_catalog/pages/firstPage.dart';
import 'package:flutter_application_2/screen/emailAuth_service.dart';
import 'package:flutter_application_2/screen/location_screen.dart';

class EmailAuthScreen extends StatefulWidget {
  static const String id = 'emailAuth-screen';
  @override
  State<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen> {
  @override
  String name = "";
  bool changeButton = false;
  bool validate = false;
  bool _login = false;
  final _formKey = GlobalKey<FormState>();
  var _emailController = TextEditingController();

  var _passwordController = TextEditingController();

  EmailAuthentication _service = EmailAuthentication();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
        validate = false;
      });
      _service
          .getAdminCredential(
              context: context,
              isLog: _login,
              password: _passwordController.text,
              email: _emailController.text)
          .then((value) {
        setState(() {
          changeButton = false;
        });
      });
      await Future.delayed(Duration(seconds: 1));

      Navigator.pushNamed(context, FirstPage.id);
      setState(() {
        changeButton = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/tfc.jpg"),
              Text(
                "सुस्वागतम! $name",
                style: TextStyle(
                  color: Color.fromARGB(255, 43, 74, 129),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "नाम लिखे |",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        final bool isValid =
                            EmailValidator.validate(_emailController.text);
                        if (value!.isEmpty || value == null) {
                          return "नाम खाली नहीं रख सकते|";
                        }
                        if (value.isNotEmpty && isValid == false) {
                          return 'Enter Valid email';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        //value is assigned
                        name = value;
                        setState(
                            () {}); //name will be displayed in welcome to..
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true, //password text will hide
                      decoration: InputDecoration(
                        hintText: "पासवर्ड लिखे |",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "पासवर्ड खाली नहीं रख सकते|";
                        } else if (value.length < 8) {
                          return "पासवर्ड 6 अंको से अधिक रखे| ";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(_login
                            ? 'New account ?'
                            : 'Already has an account ?'),
                        TextButton(
                            child: Text(
                              _login ? 'Register' : 'Login',
                              style: TextStyle(backgroundColor: Colors.cyan),
                            ),
                            onPressed: () {
                              setState(() {
                                _login = !_login;
                              });
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 40.0, //to give gap in between
                    ),
                    Material(
                      color: Colors.green,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        //use to make any thing or container clickable with effects
                        onTap: () => moveToHome(context),

                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              //color: Colors.green, since we are using box decoration so use in that
                              : Text(
                                  '${_login ? 'Login' : 'Register'}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
