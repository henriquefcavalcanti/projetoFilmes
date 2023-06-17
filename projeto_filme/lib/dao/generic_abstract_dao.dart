abstract class GenericAbstractDao<T> {
  Future<int?> save(T object);
  Future<List<T>?> findAll();
  Future<int?> update(T object);
  Future<int?> delete(int id);
}
