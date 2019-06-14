import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        top: 24,
        bottom: 24,
      ),
      padding: EdgeInsets.only(
        right: 12,
        left: 12,
      ),
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(99.0)),
        color: Colors.grey[200],
      ),
      child: TextField(
        decoration: InputDecoration.collapsed(
          hintText: "Search a Pokémon, Move, Ability, etc...",
        ),
      ),
    );
  }
}
