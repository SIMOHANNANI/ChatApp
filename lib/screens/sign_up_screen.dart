import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
//  static String routeName = 'choice/sign_up';
//  SignUpScreen(this.signUp);
//
//  final void Function(
//    String email,
//    String password,
//    BuildContext ctx,
//  ) signUp;

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  var _isLoading = false;
  final _auth = FirebaseAuth.instance;

  Future<void> _signUp(
      String username, String email, String password, BuildContext ctx) async {
    // Register the new user in the database :
    try {
      setState(() {
        _isLoading = true;
      });
      final signInResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      // Store the username of the new user:
      await Firestore.instance
          .collection('users')
          .document(signInResult.user.uid)
          .setData({
        'username': username,
        'email': email,
      });
      setState(() {
        _isLoading = false;
      });
    } on PlatformException catch (e) {
      setState(() {
        _isLoading = false;
      });
      var message = "Oops! something went wrong";
      if (e.message != null) {
        // If the error occurred ;
        message = e.message;
      }
      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(ctx).errorColor,
      ));
      print(message);
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print(e);
    }
  }

  void _validateInputs(BuildContext context) {
    final _isValid = _formKey.currentState.validate();
    if (_isValid) {
      _formKey.currentState.save();
      FocusScope.of(context).unfocus();
      // send a authentication request for the existing user trying to log in :
//      widget.signUp(_email.text, _password.text,context);
      _signUp(_username.text, _email.text, _password.text, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, //vert
//            mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center, // horiz.
          children: [
            Form(
              key: _formKey,
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
//              crossAxisAlignment: CrossAxisAlignment.s,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextFormField(
                        controller: _username,
//                    keyboardAppearance: Brightness.dark,
                        keyboardType: TextInputType.text,
//                    autofocus: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            FontAwesomeIcons.user,
                            size: 16,
                          ),
                          labelText: 'USERNAME',
                          labelStyle: TextStyle(fontSize: 10.0),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 0.0),
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (username) {
                          if (username.length > 4) {
                            return null;
                          }
                          return 'Oops! Weak username';
                        },
                        onSaved: (username) {
                          _username.text = username;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: _email,
//                    keyboardAppearance: Brightness.dark,
                        keyboardType: TextInputType.emailAddress,
//                    autofocus: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            size: 16,
                          ),
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(fontSize: 10.0),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 0.0),
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (email) {
                          if (EmailValidator.validate(email)) {
                            return null;
                          }
                          return 'Oops! You entered invalid email ';
                        },
                        onSaved: (email) {
                          _email.text = email;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: _password,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            FontAwesomeIcons.key,
                            size: 16,
                          ),
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(fontSize: 10.0),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 0.0),
                        ),
                        textInputAction: TextInputAction.send,
                        validator: (password) {
                          if (password.length > 7) {
                            return null;
                          }
                          return 'Oops! Weak password';
                        },
                        onSaved: (password) {
                          _password.text = password;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: _confirmPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            FontAwesomeIcons.key,
                            size: 16,
                          ),
                          labelText: 'RETYPE PASSWORD',
                          labelStyle: TextStyle(fontSize: 10.0),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 0.0),
                        ),
                        textInputAction: TextInputAction.send,
                        validator: (password) {
                          if (password == _password.text) {
                            return null;
                          }
                          return 'Oops! passwords doesn\'t match !';
                        },
                        onSaved: (password) {
                          _confirmPassword.text = password;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
              onPressed: () => _validateInputs(context),
              color: Colors.lightBlueAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _isLoading
                      ? Center(
                          child: SizedBox(
                          height: 15.0,
                          width: 15.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ))
                      : Center(
                          child: SizedBox(
                            width: 15.0,
                            child: null,
                          ),
                        ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'SIGN UP',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
