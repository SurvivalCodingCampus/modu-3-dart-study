import 'package:modu_3_dart_study/2025-04-04/exam/exam_01/repository/store_repository.dart';
import 'package:modu_3_dart_study/2025-04-04/exam/exam_01/repository/store_repository_impl.dart';
import 'package:test/test.dart';

import '../data/mock_store_data_source_impl.dart';

void main() {
  test('StoreRepository', () async {
    final StoreRepository repository = StoreRepositoryImpl(
      MockStoreDataSourceImpl(),
    );

    final stores = await repository.getStores();
    expect(stores.length != 222, isTrue);

  });
}
