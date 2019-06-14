import 'package:flutter/material.dart';
import '../widgets/searchbar.dart';
import '../widgets/main_page/actions_grid.dart';

class MainPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            top: 64,
            left: 16,
            right: 16,
          ),
          child: Column(
            children: <Widget>[
              _renderPageTitle(),
              SearchBar(),
              ActionsGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderPageTitle() {
    return Text(
      'What Pokémon are you looking for?',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: Colors.grey[900],
      ),
    );
  }
}
