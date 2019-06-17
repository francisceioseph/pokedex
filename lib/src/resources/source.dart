abstract class Source<T> {
  Future<List<T>> fetchResource();
  Future<T> fetchItem(int id);
}
