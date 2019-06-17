import 'package:flutter/material.dart';

class CommonsMixin {
  Widget buildPageTitle(String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: Colors.grey[900],
      ),
    );
  }

  Widget buildPageSubtitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.grey[900],
      ),
    );
  }

  Widget buildItemTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildItemSubtitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
    );
  }
}
