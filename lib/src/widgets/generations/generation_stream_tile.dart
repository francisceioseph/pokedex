import 'package:flutter/material.dart';
import 'package:pokedex/src/widgets/generations/generation_tile.dart';
import '../../blocs/generations/generations_provider.dart';
import '../../blocs/search_actions/search_actions_provider.dart';
import '../../models/action_grid.dart';
import '../../models/generation.dart';

class GenerationStreamTile extends StatelessWidget {
  final Generation generation;

  GenerationStreamTile({Key key, this.generation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = GenerationsProvider.of(context);
    final actionsBloc = SearchActionsProvider.of(context);

    bloc.fetchGeneration(generation.id);

    return StreamBuilder(
      stream: actionsBloc.choosenSearchAction,
      builder: (
        BuildContext context,
        AsyncSnapshot<ActionGridModel> gridActionSnapshot,
      ) {
        if (!gridActionSnapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return StreamBuilder(
          stream: bloc.generationsMap,
          builder: (
            BuildContext context,
            AsyncSnapshot<Map<int, Future<Generation>>> futureSnapshot,
          ) {
            if (!futureSnapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return FutureBuilder(
              future: futureSnapshot.data[generation.id],
              builder: (
                BuildContext context,
                AsyncSnapshot<Generation> generationSnapshot,
              ) {
                if (!generationSnapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return GenerationTile(
                  generation: generationSnapshot.data,
                  action: gridActionSnapshot.data,
                );
              },
            );
          },
        );
      },
    );
  }
}
