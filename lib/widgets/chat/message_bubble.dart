import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:bubble/bubble.dart';

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

  // The key to ensure improvement while rendering message from the database
  final Key key;

  MessageBubble({
    this.authUserId,
    this.storedUsersId,
    this.message,
    this.sentAt,
    this.isMine,
    this.deviceSize,
    this.key,
  });

  String sentAtToSting(Timestamp sentAt) {
    DateTime date;
    date = sentAt.toDate();
    String stringDate = DateFormat('HH:mm').format(date);
    return stringDate;
  }

  Widget build(BuildContext context) {
    return Container(
      child: Bubble(
        color: isMine ? Colors.lightGreen : Colors.white,
        margin: isMine ? BubbleEdges.only(bottom: 10,right: 10):BubbleEdges.only(bottom: 10,left: 10),
        padding: BubbleEdges.symmetric(vertical: 8.0, horizontal: 10.0),
        alignment: isMine ?  Alignment.topRight : Alignment.topLeft,
        elevation: 5.0,
        nip: isMine ? BubbleNip.rightTop : BubbleNip.leftTop,
        child: Container(
          constraints: BoxConstraints(maxWidth: deviceSize.width * 0.7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 50.0),
                    child: Text(message),
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: Row(
                      children: <Widget>[
                        Text(sentAtToSting(sentAt),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.0,
                            )),
                        SizedBox(width: 5.0),
                        Icon(
                          Icons.done_all,
                          size: 12.0,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Row(
////      mainAxisSize: MainAxisSize.min,
//mainAxisAlignment:
//isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
////      crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//Container(
//margin: isMine
//? EdgeInsets.only(right: 10.0, bottom: 20.0)
//: EdgeInsets.only(
//left: 10.0,
//bottom: 20.0,
//),
//constraints: BoxConstraints(maxWidth: deviceSize.width * 0.85),
//decoration: BoxDecoration(
//color: isMine ? Colors.green[200] : Colors.grey[300],
//borderRadius: isMine
//? BorderRadius.only(
//topLeft: Radius.circular(12),
//bottomLeft: Radius.circular(12),
//bottomRight: Radius.circular(12),
//)
//: BorderRadius.only(
//topRight: Radius.circular(12),
//bottomLeft: Radius.circular(12),
//bottomRight: Radius.circular(12),
//)),
//padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//child: Container(
//child: Column(
//mainAxisAlignment: MainAxisAlignment.end,
//crossAxisAlignment: CrossAxisAlignment.start,
//mainAxisSize: MainAxisSize.min,
//children: <Widget>[
////              Text(chatData[index]['message']),
//Text(message),
//Align(
//alignment: Alignment.bottomRight,
//child: Row(
//// Horizontally
//mainAxisAlignment: MainAxisAlignment.end,
//// Vertically
//crossAxisAlignment: CrossAxisAlignment.center,
//mainAxisSize: MainAxisSize.min,
//children: <Widget>[
////                  Text(sentAt(chatData[index]['sentAt'])),
//Text(sentAtToSting(sentAt)),
//SizedBox(width: 10.0),
//Icon(Icons.done_all)
//],
//),
//),
//],
//),
//),
//),
//],
//);



//Column(
//mainAxisAlignment: MainAxisAlignment.center,
//crossAxisAlignment: CrossAxisAlignment.end,
//children: <Widget>[
//Align(alignment: Alignment.bottomLeft, child: Text(message)),
//Row(
//mainAxisSize: MainAxisSize.min,
//mainAxisAlignment: MainAxisAlignment.end,
//children: <Widget>[
//Text(sentAtToSting(sentAt)),
//SizedBox(width: 10.0),
//Icon(Icons.done_all),
//],
//),
//],
//)