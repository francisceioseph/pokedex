import 'package:flutter/material.dart';

import '../blocs/generations/generations_bloc.dart';
import '../blocs/generations/generations_provider.dart';
import '../models/generation.dart';

class GenerationsScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = GenerationsProvider.of(context);
    bloc.fetchGenerations();

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          child: _buildGridView(bloc),
        ),
      ),
    );
  }

  Widget _buildGridView(GenerationsBloc bloc) {
    return StreamBuilder(
      stream: bloc.generations,
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Generation>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, int index) {
            return Text(snapshot.data[index].name);
          },
        );
      },
    );
  }
}
