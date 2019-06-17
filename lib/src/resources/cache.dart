abstract class Cache<T> {
  Future<int> addItem(T item);
  Future<int> clear();
}
