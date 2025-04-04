import 'package:modu_3_dart_study/dto_utils/dto_data_source.dart';
import 'package:modu_3_dart_study/dto_utils/json_convert.dart';

abstract class DtoRepository<
  T extends JsonConvert<T, E>,
  E,
  DS extends DtoDataSource<T, E>
> {
  final DS dataSource;
  final T dto;

  const DtoRepository(this.dataSource, this.dto);

  Future<List<E>> getItems() async {
    return (await dataSource.getItems()).map((e) => e.toEntity()).toList();
  }

  Future<List<E>> getItemsByLimit({int? limit}) async {
    List<E> listData = await getItems();

    if (limit == null) {
      return listData;
    }

    return listData.take(limit).toList();
  }

  Future<List<E>> getItemsWithPaging({int page = 0, int size = 10}) async {
    List<E> listData = await getItems();
    int start = page * size;
    return listData.skip(start).take(size).toList();
  }

  Future<List<E>> query(bool Function(E) predicate) async {
    final items = await getItems();
    return items.where(predicate).toList();
  }
}
