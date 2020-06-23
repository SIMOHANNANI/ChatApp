import 'package:flutter/material.dart';
//import 'screens/chat_screen.dart';
//import './screens/login_screen.dart';
import './screens/choice_screen.dart';
//import './screens/signup_screen.dart';
//import './screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent[100],
        primaryColorDark: Colors.pink,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.lightBlueAccent,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      home: ChoiceScreen(),
      routes: {
//        LogInScreen.routeName : (ctx) => LogInScreen(),
//        SignUpScreen.routeName: (ctx) => SignUpScreen(),

      },
    );
  }
}
