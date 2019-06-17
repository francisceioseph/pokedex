import 'package:rxdart/rxdart.dart';

import '../../models/generation.dart';
import '../../resources/repository.dart';

class GenerationsBloc {
  final _repository = Repository<Generation>();
  final _generations = PublishSubject<List<Generation>>();

  Observable<List<Generation>> get generations =>
      _generations.stream.map((generations) {
        return generations
            .asMap()
            .map((int index, Generation generation) {
              final g = new Generation(id: index + 1, name: generation.name);
              return MapEntry(index, g);
            })
            .values
            .toList();
      });

  fetchGenerations() async {
    final generations = await _repository.fetchResource();
    _generations.sink.add(generations);
  }

  dispose() {
    _generations.close();
  }
}
