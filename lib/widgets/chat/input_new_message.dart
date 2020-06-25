import 'package:flutter/material.dart';

class InputNewMessage extends StatefulWidget {
  _InputNewMessage createState() => _InputNewMessage();
}

class _InputNewMessage extends State<InputNewMessage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _newMessageController = TextEditingController();
  bool _isVoiceMessage = true;

  void _sendTextMessage() {
    // sending a text message :
    //...
    print('Text message');
  }

  void _sendVoiceMessage() {
    // SendingVoiceMessage :
    //...
    print('Voice message');
  }

//  @override
//  void initState() {
//    super.initState();
//    _isVoiceMessage = true;
//    _newMessageController.addListener((){setState(() {
//      _isVoiceMessage = !_isVoiceMessage;
//    });});
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
                EdgeInsets.only(left: 10.0, right: 10, top: 20.0, bottom: 10),
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: TextFormField(
                controller: _newMessageController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type a message ...',
                  hintStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                onChanged: (value) {
                  setState(() {
//                    _newMessageController.value = TextEditingValue(
//                        text: _newMessageController.text,
//                        selection: TextSelection(
//                          baseOffset: _newMessageController.text.length,
//                          extentOffset: null,
//                        ));
                    if (value.length > 0) {
                      _isVoiceMessage = false;
                    }else{
                      _isVoiceMessage = true;
                    }
                    print(value);
                  });
                },
              ),
            ),
          ),
        ),
        Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.green[700]),
            margin:
                EdgeInsets.only(left: 0.0, right: 0.0, top: 20.0, bottom: 10),
            child: IconButton(
              icon: _isVoiceMessage
                  ? Icon(
                      Icons.send,
                      size: 20,
                    )
                  : Icon(
                      Icons.keyboard_voice,
                      size: 20,
                    ),
              onPressed: () {
                // Send text message if the length of the message is greater than zero :
                _newMessageController.text.trim().length > 0
                    ? _sendTextMessage()
                    : _sendVoiceMessage();
              },
              color: Colors.white,
            )),
        SizedBox(
          width: 10.0,
        ),
      ],
    );
  }
}
