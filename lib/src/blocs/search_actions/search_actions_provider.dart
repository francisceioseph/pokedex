import 'package:flutter/material.dart';
import 'search_actions_bloc.dart';

class SearchActionsProvider extends InheritedWidget {
  final SearchActionsBloc bloc;

  SearchActionsProvider({Key key, Widget child})
      : bloc = SearchActionsBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static SearchActionsBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(SearchActionsProvider)
            as SearchActionsProvider)
        .bloc;
  }
}
