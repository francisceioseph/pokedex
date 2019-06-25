import 'package:flutter/material.dart';

import '../../blocs/generations/generations_provider.dart';
import '../../models/action_grid.dart';
import '../../models/generation.dart';
import '../../constants.dart';

class GenerationTile extends StatelessWidget {
  final Generation generation;
  final ActionGridModel action;

  GenerationTile({
    Key key,
    this.generation,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = GenerationsProvider.of(context);
    return GestureDetector(
      onTap: () {
        bloc.chooseGeneration(generation);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: 4,
          right: 4,
          left: 4,
          bottom: 4,
        ),
        decoration: BoxDecoration(
            color: Color(kGenerationColorHex),
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
          generation.englishName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(kGenerationTextColorHex),
          ),
        ),
      ),
    );
  }
}
