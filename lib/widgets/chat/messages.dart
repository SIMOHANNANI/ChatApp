import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: StreamBuilder(
        stream: Firestore.instance
            .collection('chat')
            .orderBy('sentAt', descending: false)
            .snapshots(),
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
                return Container(
                  constraints:
                      BoxConstraints(maxWidth: deviceSize.width * 0.85),
                  decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.circular(10.0)),
//                  padding: EdgeInsets.symmetric(
//                    vertical: 10.0,
//                    horizontal: 0.0,
//                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 10.0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 10.0,
                        ),
                        constraints:
                            BoxConstraints(maxWidth: deviceSize.width * 0.90),
                        child: Text(chatData[index]['message'],style: TextStyle(fontSize: 20.0),),
                      ),
                      Container(
                        constraints:
                            BoxConstraints(maxWidth: deviceSize.width * 0.5),
                        child: Icon(
                          Icons.done_all,
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}

//return ListView.builder(
//itemCount: chatData.length,
//itemBuilder: (ctx, index) {
//return ListTile(
//title: Text(chatData[index]['message']),
//onLongPress: (){
//// to remove the message.
//print('removing the message');
//},
//trailing:
//Icon(Icons.done_outline),
//);
//});

//ListTile(
//title: Row(
//crossAxisAlignment: CrossAxisAlignment.end,
//mainAxisSize: MainAxisSize.min,
//children: <Widget>[
//Container(
//constraints:
//BoxConstraints(maxWidth: deviceSize.width * 0.85),
//decoration: BoxDecoration(
//color: Colors.green[200],
//borderRadius: BorderRadius.circular(10.0)),
//padding: EdgeInsets.symmetric(
//vertical: 10.0, horizontal: 10.0),
//child: Text(chatData[index]['message']),
//),
//Container(
//child: Row(
//children: <Widget>[
////                      Container(child:Text('12:12 PM')),
//Icon(Icons.done_outline),
//],
//),
//),
//],
//),
//onLongPress: () {
//// to remove the message.
//print('removing the message');
//},
////                  trailing: SizedBox(
////                    width: 10.0,
////                    height: 1.0,
////                    child: Row(
////                      children: <Widget>[
//////                      Container(child:Text('12:12 PM')),
////                        Icon(Icons.done_outline),
////                      ],
////                    ),
////                  ),
//);
