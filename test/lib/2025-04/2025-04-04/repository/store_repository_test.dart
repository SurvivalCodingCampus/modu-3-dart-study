import 'package:modu_3_dart_study/2025-04/2025-04-04/data_source/http_store_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/model/store.dart'
    show Store;
import 'package:modu_3_dart_study/2025-04/2025-04-04/repository/store_repository.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/repository/store_repository_impl.dart';
import 'package:test/test.dart';
import '../mock/mock_client.dart';

void main() {
  final StoreDataSource dataSource = HttpStoreDataSource(storeMockClient);
  final StoreRepository storeRepository = StoreRepositoryImpl(dataSource);

  test('findAll() 호출시 데이터를 Store 형태로 가져와야 한다.', () async {
    List<Store> stores = await storeRepository.findAll();
    expect(stores, isNotEmpty);
    expect(stores.last.name, '대지약국');
  });

  test('findOne() 호출 시 인자로 필터 함수를 전달할 수 있어야한다.', () async {
    Store? store = await storeRepository.findOne(
      (store) => store.name == '대지약국',
    );

    expect(store, isNotNull);
  });
}
