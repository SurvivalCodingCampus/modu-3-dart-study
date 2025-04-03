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

  Future<List<T>> getItems() async {
    return (await dataSource.getItems())
        .map((e) => entity.fromJson(e) as T)
        .toList();
  }

  Future<List<T>> getItemsByKey(ID key) async {
    return (await getItems())
        .where((element) => element.filterKey == key)
        .toList();
  }

  Future<List<T>> getItemsByLimit({int? limit}) async {
    List<T> listData = await getItems();

    if (limit == null) {
      return listData;
    }

    return listData.take(limit).toList();
  }

  Future<List<T>> getItemsWithPaging({int page = 0, int size = 10}) async {
    List<T> listData = await getItems();
    int start = page * size;
    return listData.skip(start).take(size).toList();
  }

  Future<List<T>> query(bool Function(T) predicate) async {
    final items = await getItems();
    return items.where(predicate).toList();
  }
}
