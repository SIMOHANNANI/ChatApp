import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CharScreen extends StatefulWidget {
  _CharScreen createState() => _CharScreen();
}

class _CharScreen extends State<CharScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat application'),
      ),
      body: StreamBuilder(
          stream: Firestore.instance
              .collection('chats/7NTl6R21EHDDw1XP2rrA/messages/')
              .snapshots(),
          builder: (ctx, stream) {
            if (stream.connectionState == ConnectionState.waiting) {
              return Center(
                  child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(),
              ));
            }
            final documents = stream.data.documents;
            return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                    child: Text('${documents[index]['text']}'),
                  );
                });
          }),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.data_usage), onPressed: (){
            Firestore.instance.collection('chats/7NTl6R21EHDDw1XP2rrA/messages').add({'text':'added in the app'});
          }),
    );
  }
}
