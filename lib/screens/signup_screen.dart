import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
//  static String routeName = 'choice/sign_up';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,),
      body: Center(
        child: Text('Sign Up ... Comming Soon'),
      ),
    );
  }
}
