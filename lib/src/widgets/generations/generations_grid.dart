import 'package:flutter/material.dart';
import '../../models/generation.dart';
import '../../widgets/commons.dart';
import 'generation_tile.dart';

class GenerationsGrid extends StatelessWidget with CommonsMixin {
  final List<Generation> generations;

  GenerationsGrid({@required this.generations});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 8,
        left: 8,
        right: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 24),
            child: buildPageTitle('Choose your Generation'),
          ),
          GridView.count(
            padding: EdgeInsets.only(
              bottom: 4,
            ),
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            children: _buildTiles(),
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildTiles() {
    return generations.map((generation) {
      return GenerationGridTile(
        title: generation.name,
      );
    }).toList();
  }
}
