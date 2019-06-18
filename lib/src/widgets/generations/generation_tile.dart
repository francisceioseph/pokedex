import 'package:flutter/material.dart';
import 'package:pokedex/src/blocs/generations/generations_provider.dart';
import '../../models/generation.dart';
import '../../constants.dart';

class GenerationGridTile extends StatelessWidget {
  final Generation generation;

  GenerationGridTile({Key key, this.generation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = GenerationsProvider.of(context);
    bloc.fetchGeneration(generation.id);

    return StreamBuilder(
      stream: bloc.generationsMap,
      builder: (
        BuildContext context,
        AsyncSnapshot<Map<int, Future<Generation>>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return FutureBuilder(
          future: snapshot.data[generation.id],
          builder: (BuildContext context, AsyncSnapshot<Generation> snap) {
            if (!snap.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return _buildGenerationTile(snap.data);
          },
        );
      },
    );
  }

  Widget _buildGenerationTile(Generation gen) {
    return Container(
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
        gen.englishName,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(kGenerationTextColorHex),
        ),
      ),
    );
  }
}
