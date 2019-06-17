import 'package:flutter/material.dart';

class GenerationGridTile extends StatelessWidget {
  final String title;
  final int colorHex;

  GenerationGridTile({
    Key key,
    this.title,
    this.colorHex = 0xff4ec2a8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        top: 4,
        right: 4,
        left: 4,
        bottom: 4,
      ),
      decoration: BoxDecoration(
          color: Color(colorHex),
          borderRadius: BorderRadius.all(
            Radius.circular(22.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[350],
              blurRadius: 2.0,
              spreadRadius: 1.0,
              offset: Offset(
                0.0,
                4.0,
              ),
            )
          ]),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
