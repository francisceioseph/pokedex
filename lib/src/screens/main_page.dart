import 'package:flutter/material.dart';
import '../widgets/searchbar.dart';
import '../widgets/main_page/actions_grid.dart';
import '../widgets/main_page/news_list.dart';

class MainPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xfff5f5f5),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(
                top: 64,
                left: 8,
                right: 8,
                bottom: 30,
              ),
              child: Column(
                children: [
                  _renderPageTitle(),
                  SearchBar(),
                  ActionsGrid(),
                  NewsList(),
                ],
              ),
            ),
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
