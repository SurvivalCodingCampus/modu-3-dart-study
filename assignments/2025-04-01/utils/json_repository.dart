import 'json_convertible.dart';
import 'json_data_source.dart';

abstract class JsonRepository<
  T extends JsonConvertible,
  ID,
  DS extends JsonDataSource
> {
  final DS dataSource;
  final T entity;

  const JsonRepository(this.dataSource, this.entity);

  Future<List<T>> getItems(String fileName) async {
    return (await dataSource.getItems(
      fileName,
    )).map((e) => entity.fromJson(e) as T).toList();
  }

  Future<List<T>> getItemsByKey(ID key, String fileName) async {
    return (await getItems(
      fileName,
    )).where((element) => element.filterKey == key).toList();
  }

  Future<List<T>> getItemsByLimit(String fileName, {int? limit}) async {
    List<T> listData = await getItems(fileName);

    if (limit == null) {
      return listData;
    }

    return listData.take(limit).toList();
  }

  Future<List<T>> getItemsWithPaging(
    String fileName, {
    int page = 0,
    int size = 10,
  }) async {
    List<T> listData = await getItems(fileName);
    int start = page * size;
    return listData.skip(start).take(size).toList();
  }

  Future<List<T>> query(String fileName, bool Function(T) predicate) async {
    final items = await getItems(fileName);
    return items.where(predicate).toList();
  }
}
