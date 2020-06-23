import 'package:Ch/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './login_screen.dart';
import '../widgets/slide_right_transition.dart';
import '../widgets/scale_route.dart';

class ChoiceScreen extends StatefulWidget {
  @override
  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton.icon(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
                    shape: RoundedRectangleBorder(
//                    side: BorderSide(
//                      color: Colors.grey,
//                      width: 0.0,
//                    ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(SlideRightRoute(widget:LogInScreen()));
                    },
                    color: Colors.white,
                    icon: FaIcon(
                      FontAwesomeIcons.signInAlt,
                      size: 16,
                    ),
                    label: Text('Log In'),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton.icon(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
                    shape: RoundedRectangleBorder(
//                    side: BorderSide(
//                      color: Colors.white,
//                      width: 2.0,
//                    ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(ScaleRoute(widget:SignUpScreen()));
                    },
                    color: Colors.lightBlueAccent,
                    icon: FaIcon(
                      FontAwesomeIcons.userPlus,
                      size: 16,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
