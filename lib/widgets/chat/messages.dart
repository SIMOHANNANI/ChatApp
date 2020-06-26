import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import './message_bubble.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery
        .of(context)
        .size;
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (ctx, futureSnapshot) {
          if (futureSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: CircularProgressIndicator(),
                ));
          }
          return StreamBuilder(
              stream: Firestore.instance
                  .collection('chat')
                  .orderBy('sentAt', descending: false)
                  .snapshots(),
              builder: (ctx, messageSnapShoot) {
                if (messageSnapShoot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: SizedBox(
                      height: 100.0,
                      width: 100.0,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                final chatData = messageSnapShoot.data.documents;
//                final _isMine = chatData;

                return ListView.builder(
                  itemCount: chatData.length,
                  itemBuilder: (ctx, index) =>
                      MessageBubble(
                          authUserId: futureSnapshot.data.uid,
                          storedUsersId: chatData[index]['userId'],
                          message: chatData[index]['message'],
                          sentAt: chatData[index]['sentAt'],
                          isMine: futureSnapshot.data.uid ==
                              chatData[index]['userId'],
                          deviceSize: deviceSize,
                          key: ValueKey(chatData[index].documentID),
                      ),
                );
              });
        },
      ),
    );
  }
}
