import 'dart:async';

abstract interface class Db<T extends Object> {
  Future<void> insert(T item);
  Future<void> insertAll(List<T> items);
  Future<T?> get(Object id);
  Future<List<T>> getAll();
  Future<void> delete(T item);
  Future<void> deleteAll();
  Future<void> update(T item);
  Future<void> updateAll(List<T> items);
  Stream<void> onDbchanged();
}
