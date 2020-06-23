//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogInScreen extends StatefulWidget {
//  static String routeName = 'choice/log_in';
  _AuthScreen createState() => _AuthScreen();
}

class _AuthScreen extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(child: Text('Log In'),),
                  TextFormField(
//                    keyboardAppearance: Brightness.dark,
                    keyboardType: TextInputType.emailAddress,
//                    autofocus: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.user,size: 16,),
                      labelText: 'USERNAME OR EMAIL',
                      labelStyle: TextStyle(fontSize: 14.0)
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
