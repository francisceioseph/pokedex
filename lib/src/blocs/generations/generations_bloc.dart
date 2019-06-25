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

  final _metaGenerations = PublishSubject<List<Generation>>();

  final _generationFetcher = PublishSubject<int>();
  final _generationOutput = BehaviorSubject<Map<int, Future<Generation>>>();
  final _choosenGeneration = BehaviorSubject<Generation>();

  GenerationsBloc() {
    _generationFetcher.stream
        .transform(_generationsTransformer())
        .pipe(_generationOutput);
  }

  Observable<List<Generation>> get metaGenerations =>
      _metaGenerations.stream.map((generations) {
        return generations
            .asMap()
            .map((int index, Generation generation) {
              final g = new Generation(id: index + 1, name: generation.name);
              return MapEntry(index, g);
            })
            .values
            .toList();
      });

  fetchMetaGenerations() async {
    final generations = await _repository.fetchResource();
    _metaGenerations.sink.add(generations);
  }

  Observable<Map<int, Future<Generation>>> get generationsMap =>
      _generationOutput.stream;

  Function(int) get fetchGeneration => _generationFetcher.sink.add;

  Observable<Generation> get choosenGeneration => _choosenGeneration.stream;
  Function(Generation) get chooseGeneration => _choosenGeneration.sink.add;

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
    _metaGenerations.close();
    _generationFetcher.close();
    _generationOutput.close();
    _choosenGeneration.close();
  }
}
