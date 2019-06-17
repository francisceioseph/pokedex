import 'package:flutter/material.dart';
import 'generations_bloc.dart';

class GenerationsProvider extends InheritedWidget {
  final GenerationsBloc bloc;

  GenerationsProvider({Key key, Widget child})
      : bloc = GenerationsBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static GenerationsBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(GenerationsProvider)
            as GenerationsProvider)
        .bloc;
  }
}
