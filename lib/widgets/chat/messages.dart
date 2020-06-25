import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('chat').snapshots(),
      builder: (ctx, messageSnapShoot) {
        if (messageSnapShoot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
              height: 100.0,
              width: 100.0,
              child: CircularProgressIndicator(),
            ),
          );
        }
        final chatData = messageSnapShoot.data.documents;
        return ListView.builder(
            itemCount: chatData.length,
            itemBuilder: (ctx, index) {
              return Center(
                  child:
                      Text(chatData[index]['message']));
            });
      },
    );
  }
}
