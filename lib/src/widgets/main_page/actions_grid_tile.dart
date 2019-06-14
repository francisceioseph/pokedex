import 'package:flutter/material.dart';

class ActionsGridTile extends StatelessWidget {
  final String title;
  final int colorHex;

  ActionsGridTile({Key key, this.title, this.colorHex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 18),
      decoration: BoxDecoration(
        color: Color(colorHex),
        borderRadius: BorderRadius.all(
          Radius.circular(22.0),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
