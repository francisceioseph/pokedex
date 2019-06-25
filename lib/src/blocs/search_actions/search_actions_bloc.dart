import 'package:pokedex/src/models/action_grid.dart';
import 'package:rxdart/rxdart.dart';

class SearchActionsBloc {
  final _choosenSearchAction = BehaviorSubject<ActionGridModel>();

  Observable<ActionGridModel> get choosenSearchAction =>
      _choosenSearchAction.stream;

  Function(ActionGridModel) get chooseSearchAction =>
      _choosenSearchAction.sink.add;

  dispose() {
    _choosenSearchAction.close();
  }
}
