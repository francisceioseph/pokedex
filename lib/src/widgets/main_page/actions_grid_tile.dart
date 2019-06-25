import 'package:flutter/material.dart';
import 'package:pokedex/src/blocs/search_actions/search_actions_provider.dart';
import 'package:pokedex/src/models/action_grid.dart';

class ActionsGridTile extends StatelessWidget {
  final ActionGridModel action;

  ActionsGridTile({Key key, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final bloc = SearchActionsProvider.of(context);
        bloc.chooseSearchAction(action);
        Navigator.of(context).pushNamed('/generations');
      },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(
          left: 18,
        ),
        margin: EdgeInsets.only(
          top: 4,
          right: 4,
          left: 4,
          bottom: 4,
        ),
        decoration: BoxDecoration(
            color: Color(action.colorHex),
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
          action.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
