//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogInScreen extends StatefulWidget {
//  static String routeName = 'choice/log_in';
  _AuthScreen createState() => _AuthScreen();
}

class _AuthScreen extends State<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _validateInputs(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, //vert
//            mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center, // horiz.
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
//              crossAxisAlignment: CrossAxisAlignment.s,
                children: <Widget>[

                  Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
//                    keyboardAppearance: Brightness.dark,
                    keyboardType: TextInputType.emailAddress,
//                    autofocus: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        FontAwesomeIcons.user,
                        size: 16,
                      ),
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(fontSize: 10.0),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 0.0),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value){
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        FontAwesomeIcons.key,
                        size: 16,
                      ),
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(fontSize: 10.0),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 0.0),
                    ),
                    textInputAction: TextInputAction.send,
                  ),
                ],
              ),
            ),
            FlatButton(
              padding:
              EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
              onPressed: () {
//              Navigator.of(context).push(ScaleRoute(widget:SignUpScreen()));
              },
              color: Colors.lightBlueAccent,
              child: Text(
                'LOG IN',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
