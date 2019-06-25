import 'package:flutter/material.dart';
import 'package:pokedex/src/blocs/search_actions/search_actions_provider.dart';
import '../widgets/searchbar.dart';
import '../widgets/main_page/actions_grid.dart';
import '../widgets/main_page/news_list.dart';
import '../widgets/commons.dart';

class MainPage extends StatelessWidget with CommonsMixin {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xfff5f5f5),
          ),
          child: SearchActionsProvider(
            child: ListView(
              children: <Widget>[
                _buildSearchContainer(),
                NewsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchContainer() {
    return Container(
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
          bottom: 20,
        ),
        child: ListView(
          physics: ScrollPhysics(), // to disable GridView's scrolling
          shrinkWrap: true,
          children: [
            buildPageTitle('What Pokémon are you looking for?'),
            SearchBar(),
            ActionsGrid(),
          ],
        ),
      ),
    );
  }
}
