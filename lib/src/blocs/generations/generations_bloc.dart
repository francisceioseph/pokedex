import 'dart:async';
import 'package:rxdart/rxdart.dart';

import '../../models/generation.dart';
import '../../resources/repository.dart';
import '../../resources/generations/source.dart';

class GenerationsBloc {
  final _repository = Repository<Generation>(
    sources: [GenerationSource()],
    caches: [],
  );

  final _generations = PublishSubject<List<Generation>>();

  final _generationFetcher = PublishSubject<int>();
  final _generationOutput = BehaviorSubject<Map<int, Future<Generation>>>();

  GenerationsBloc() {
    _generationFetcher.stream
        .transform(_generationsTransformer())
        .pipe(_generationOutput);
  }

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

  Observable<Map<int, Future<Generation>>> get generationsMap =>
      _generationOutput.stream;

  fetchGenerations() async {
    final generations = await _repository.fetchResource();
    _generations.sink.add(generations);
  }

  Function(int) get fetchGeneration => _generationFetcher.sink.add;

  _generationsTransformer() {
    return ScanStreamTransformer(
      (Map<int, Future<Generation>> cache, int id, index) {
        cache[id] = _repository.fetchItem(id);
        return cache;
      },
      <int, Future<Generation>>{},
    );
  }

  dispose() {
    _generations.close();
    _generationFetcher.close();
    _generationOutput.close();
  }
}
