import 'package:modu_3_dart_study/assignments/2025-04-04/src/solution/model/store.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/src/solution/repository/store_repository_impl.dart';
import 'package:test/test.dart';

import 'mock/mock_store_data_source_impl.dart';

void main() {
  group('Store Repository Test', () {
    final dataSource = MockStoreDataSourceImpl();
    final repository = StoreRepositoryImpl(storeDataSource: dataSource);
    test('stores 테스트', () async {
      final result = await repository.getStores();
      expect(result, isA<List<Store>>());
      expect(
        result.length,
        1,
      ); //mock 데이터는 총 5개의 map<string, dynamic>이 존재하지만 create_at, remian_stat, stock_at이 null인 데이터는 제외하였으므로 1개만 가져와야한다
    });

    test('store 테스트 - code가 있는 경우', () async {
      final String testCode = '11817488';
      final result = await repository.getStore(testCode); //

      expect(result, isA<Store>());
    });

    test('store 테스트 - code가 없는 경우', () {
      final String testCode = '1';

      expect(() async => await repository.getStore(testCode), throwsException);
    });
  });
}
