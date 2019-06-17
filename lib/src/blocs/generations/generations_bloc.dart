import 'package:rxdart/rxdart.dart';
import '../../models/generation.dart';
import '../../resources/repository.dart';

class GenerationsBloc {
  final _repository = Repository<Generation>();
  final _generations = PublishSubject<List<Generation>>();

  Observable<List<Generation>> get generations => _generations.stream;

  fetchGenerations() async {
    final generations = await _repository.fetchResource();
    _generations.sink.add(generations);
  }

  dispose() {
    _generations.close();
  }
}
