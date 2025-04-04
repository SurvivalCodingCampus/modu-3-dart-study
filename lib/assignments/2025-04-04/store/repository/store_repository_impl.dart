import 'package:modu_3_dart_study/assignments/2025-04-04/store/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/store/dto/store_dto.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/store/mapper/store_mapper.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/store/model/store.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/store/repository/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource _dataSource;

  StoreRepositoryImpl({required StoreDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Store>> getStores() async {
    try {
      final List<StoreDto> dtoList = await _dataSource.getDtoStores();

      final storeList =
          dtoList
              .map((e) => e.toStore())
              .where(
                (element) =>
                    (element.remainStat != '' &&
                        element.stockAt != DateTime(1999, 1, 1) &&
                        element.createdAt != DateTime(1999, 1, 1)),
              )
              .toList();
      return storeList;
    } catch (e) {
      throw Exception(e);
    }
  }
}
