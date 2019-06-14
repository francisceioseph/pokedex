import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Align(
            alignment: Alignment.center,
            child: Text(
              'This page is not available for you now.',
              textScaleFactor: 1.33,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: RaisedButton(
              child: Text('Go to Home page'),
              onPressed: _goToHomePage(context),
            ),
          )
        ],
      ),
    );
  }

  _goToHomePage(BuildContext context) {
    return () => Navigator.popAndPushNamed(context, '/');
  }
}
