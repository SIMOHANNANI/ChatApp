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
        primaryColor: Colors.amberAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChoiceScreen(),
      routes: {
//        LogInScreen.routeName : (ctx) => LogInScreen(),
//        SignUpScreen.routeName: (ctx) => SignUpScreen(),

      },
    );
  }
}
