import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/chat/messages.dart';
import '../widgets/chat/input_new_message.dart';

class CharScreen extends StatefulWidget {
  _CharScreen createState() => _CharScreen();
}

class _CharScreen extends State<CharScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 10,
        title: Row(
          children: <Widget>[
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Darling',
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
//            color: Colors.green,
          ),
          onPressed: () {
            // maybe something in the dev future
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.videocam,
//              color: Colors.green,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.call,
//              color: Colors.green,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
//              color: Colors.green,
            ),
            onPressed: () {
              // logout the user :
              FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Expanded(child: Messages()),
          InputNewMessage(),
        ],
      )),
//      floatingActionButton: FloatingActionButton(
//          child: Icon(Icons.data_usage),
//          onPressed: () {
//            Firestore.instance
//                .collection('chats/7NTl6R21EHDDw1XP2rrA/messages')
//                .add({'text': 'added in the app'});
//          }),
    );
  }
}
