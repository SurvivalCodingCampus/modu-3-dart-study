import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/store/data_source/impl/store_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/store/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/store/model/store.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/store/repository/store_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/store/repository/store_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('store test', (){
    final StoreDataSource dataSource = StoreDataSourceImpl();
    final StoreRepository repo = StoreRepositoryImpl(dataSource);

    test('all store fetch test', () async {
      final stores = await repo.fetchStores();
      final store = {
      "addr": "서울특별시 강북구 솔매로 38 (미아동)",
      "code": "11817488",
      "createdAt": "2020/07/03 11:00:00",
      "lat": 37.6254369,
      "lng": 127.0164096,
      "name": "승약국",
      "remainStat": "plenty",
      "stockAt": "2020/07/02 18:05:00",
      "type": "01"
    };
      expect(stores, isA<List<Store>>());
      expect(stores[0].toJson(), equals(store));
    });

    test('filtered store fetch test', () async {
      final stores = await repo.filteredStores();
      expect(stores, isA<List<Store>>());
    });
  });
}