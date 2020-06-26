import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/chat_screen.dart';
import './screens/choice_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.pink,
        primarySwatch: Colors.blue,
        errorColor: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.lightBlueAccent,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, userSnap){
          // a valid token
          if(userSnap.hasData){
            return CharScreen();
          }
          else{
          return ChoiceScreen();
          }
        },
      ),
      routes: {
//        LogInScreen.routeName : (ctx) => LogInScreen(),
//        SignUpScreen.routeName: (ctx) => SignUpScreen(),

      },
    );
  }
}
