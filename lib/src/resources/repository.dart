import 'package:meta/meta.dart';

import './cache.dart';
import './source.dart';

class Repository<T> {
  final List<Source<T>> sources;
  final List<Cache<T>> caches;

  Repository({@required this.sources, @required this.caches});

  Future<List<T>> fetchResource() async {
    List<T> resources;

    for (var source in sources) {
      resources = await source.fetchResource();
      if (resources != null) break;
    }

    return resources;
  }

  Future<T> fetchItem(int id) async {
    T item;
    var source;

    for (source in sources) {
      item = await source.fetchItem(id);
      if (item != null) break;
    }

    for (var cache in caches) {
      if (cache != source) {
        cache.addItem(item);
      }
    }

    return item;
  }

  Future<void> clearCache() async {
    for (var cache in caches) {
      await cache.clear();
    }
  }
}
