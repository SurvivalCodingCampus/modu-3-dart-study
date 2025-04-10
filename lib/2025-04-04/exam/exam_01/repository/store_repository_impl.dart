import 'package:modu_3_dart_study/2025-04-04/exam/exam_01/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/exam/exam_01/mapper/store_mapper.dart';
import 'package:modu_3_dart_study/2025-04-04/exam/exam_01/model/store.dart';
import 'package:modu_3_dart_study/2025-04-04/exam/exam_01/repository/store_repository.dart';

import '../data_source/store_data_source_impl.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource _dataSource;

  StoreRepositoryImpl(this._dataSource);

  @override
  Future<List<Store>> getStores() async {
    try {
      final result = await _dataSource.getStoresResultDto();

      if (result.stores == null) {
        return [];
      }

      return result.stores!
          .where(
            (e) =>
        e.remainStat != null && e.stockAt != null && e.createdAt != null,
      )
          .map((e) => e.toStore())
          .toList();
    } catch (e) {
      return [];
    }
  }
}
