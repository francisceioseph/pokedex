import 'package:flutter/material.dart';
import '../../mocks/actions_grid.dart';
import './actions_grid_tile.dart';

class ActionsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(
        bottom: 4,
      ),
      crossAxisCount: 2,
      childAspectRatio: 2,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      children: _buildTiles(),
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
