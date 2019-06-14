import 'package:flutter/material.dart';
import '../../mocks/actions_grid.dart';
import './actions_grid_tile.dart';

class ActionsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 18 / 9,
        children: _buildTiles(),
      ),
    );
  }

  _buildTiles() {
    return actionsGridMock.map((action) {
      return ActionsGridTile(
        title: action.title,
        colorHex: action.colorHex,
      );
    }).toList();
  }
}
