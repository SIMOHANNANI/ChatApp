import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  // The current connected user ...
  final String authUserId;

  // The user id present in the database , basically tha will help us
  // confirming whether a message belongs to the connected user or someone else..
  final String storedUsersId;

  // message present in the database
  final String message;

  // the time of sending the the message...
  final Timestamp sentAt;

  // The message belong to the connected user...
  bool isMine;

  //Device size to display correctly the message and to avoid outfitting
  // the screen
  final Size deviceSize;

  MessageBubble({
    this.authUserId,
    this.storedUsersId,
    this.message,
    this.sentAt,
    this.isMine,
    this.deviceSize,
  });

  String sentAtToSting(Timestamp sentAt) {
    DateTime date;
    date = sentAt.toDate();
    String stringDate = DateFormat('HH:mm').format(date);
    return stringDate;
  }

  Widget build(BuildContext context) {
    return Row(
      //      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:
          isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
      //      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: isMine
              ? EdgeInsets.only(right: 10.0, bottom: 20.0)
              : EdgeInsets.only(
                  left: 10.0,
                  bottom: 20.0,
                ),
          constraints: BoxConstraints(maxWidth: deviceSize.width * 0.85),
          decoration: BoxDecoration(
              color: isMine ? Colors.green[200] : Colors.grey[300],
              borderRadius: BorderRadius.circular(10.0)),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
//              Text(chatData[index]['message']),
              Text(message),
              Row(
                // Horizontally
                mainAxisAlignment: MainAxisAlignment.end,
                // Vertically
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
//                  Text(sentAt(chatData[index]['sentAt'])),
                  Text(sentAtToSting(sentAt)),
                  SizedBox(width: 10.0),
                  Icon(Icons.done_all)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
