import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/flutter_catalog/pages/firstPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));

      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  FirstPage())); //Navigator.pushNamed(context, FirstPage());
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
              Image.asset("assets/images/login.png"),
              Text(
                "सुस्वागतम!", //$name",
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
                      decoration: InputDecoration(
                        hintText: "Email|",
                        labelText: "Email",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email cannot be empty";
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
                      obscureText: true, //password text will hide
                      decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 8) {
                          return "Password should be more than 6 digit";
                        }
                        return null;
                      },
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
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                          //decoration: BoxDecoration(
                          //color: Colors.green, (using in material box above inkwell function such that there is splash color on clicking login button)
                        ),
                      ),
                    ),

                    // ElevatedButton(
                    // child: Text("Login"),
                    //  style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                    // onPressed: () {
                    //   Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //  },
                    //),
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
