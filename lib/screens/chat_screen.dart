import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/chat/messages.dart';

class CharScreen extends StatefulWidget {
  _CharScreen createState() => _CharScreen();
}

class _CharScreen extends State<CharScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat application'),
        actions: <Widget>[
          DropdownButton(
            icon: Icon(
              Icons.reorder,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('Log Out'),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                value: 'logout',
              ),
            ],
            onChanged: (itemValue) {
              if (itemValue == 'logout') {
                // logout the user :
                FirebaseAuth.instance.signOut();
              }
            },
          ),
        ],
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Expanded(child: Messages()),
        ],
      )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.data_usage),
          onPressed: () {
            Firestore.instance
                .collection('chats/7NTl6R21EHDDw1XP2rrA/messages')
                .add({'text': 'added in the app'});
          }),
    );
  }
}
