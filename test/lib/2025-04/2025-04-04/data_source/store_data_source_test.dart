import 'package:modu_3_dart_study/2025-04/2025-04-04/data_source/http_store_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/dto/store_dto.dart'
    show StoreDto;
import 'package:test/test.dart';

import '../mock/mock_client.dart' show storeMockClient;

void main() {
  final StoreDataSource dataSource = HttpStoreDataSource(storeMockClient);

  test('fetchStore() 호출 시 List<StoreDto>를 반환해야한다.', () async {
    final List<StoreDto> stores = await dataSource.fetch();

    expect(stores, isNotEmpty);
    expect(stores[0].name, equals('승약국'));
  });

  test(
    'fetchStore() 호출 시 remainStat, stockAt, createdAt이 빈 StoreDto는 없어야한다.',
    () async {
      final List<StoreDto> stores = await dataSource.fetch();

      List<StoreDto> none =
          stores
              .where(
                (e) =>
                    e.remainStatus == null &&
                    e.stockAt == null &&
                    e.createdAt == null,
              )
              .toList();

      expect(stores, isNotEmpty);
      expect(none, isEmpty);
    },
  );
}
