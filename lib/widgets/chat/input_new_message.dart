import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InputNewMessage extends StatefulWidget {
  _InputNewMessage createState() => _InputNewMessage();
}

class _InputNewMessage extends State<InputNewMessage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _newMessageController = TextEditingController();
  bool _isVoiceMessage = true;

  Future <void> _sendTextMessage() async {
    // sending a text message :
    //...
    print('Text message');
    final currentUser = await FirebaseAuth.instance.currentUser();
     Firestore.instance.collection('chat').add({
      'message': _newMessageController.text,
      'sentAt': Timestamp.now(),
      'userId': currentUser.uid,
    });
    _newMessageController.clear();
    setState(() {
      _isVoiceMessage = true;
    });
  }

  void _sendVoiceMessage() {
    // SendingVoiceMessage :
    //...
    print('Voice message');
  }

  // Commented text but would be useful later on ..
//  @override
//  void initState() {
//    super.initState();
//    _isVoiceMessage = true;
//  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _newMessageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
//      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0), color: Colors.white),
            margin:
                EdgeInsets.only(left: 10.0, right: 10, top: 10.0, bottom: 10),
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: TextFormField(
                controller: _newMessageController,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type a message ...',
                  hintStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                onChanged: (value) {
                  setState(() {
                    if (value.trim().length > 0) {
                      _isVoiceMessage = false;
                    } else {
                      _isVoiceMessage = true;
                    }
                  });
                },
              ),
            ),
          ),
        ),
        Container(
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.green[700]),
          margin: EdgeInsets.only(left: 0.0, right: 0.0, top: 20.0, bottom: 10),
          child: IconButton(
            icon: _isVoiceMessage
                ? Icon(
                    Icons.keyboard_voice,
                    size: 20,
                  )
                : Icon(
                    Icons.send,
                    size: 20,
                  ),
            onPressed: () {
              // Send text message if the length of the message is greater than zero :
              _newMessageController.text.trim().length > 0
                  ? _sendTextMessage()
                  : _sendVoiceMessage();
            },
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
      ],
    );
  }
}
