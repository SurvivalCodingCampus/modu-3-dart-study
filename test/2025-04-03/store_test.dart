import 'package:modu_3_dart_study/2025-04-03/solution1/data_sourece/mock_store_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/solution1/data_sourece/store_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/solution1/dto/store_dto.dart';
import 'package:modu_3_dart_study/2025-04-03/solution1/mapper/store_mapper.dart';
import 'package:modu_3_dart_study/2025-04-03/solution1/repository/store_repository.dart';
import 'package:modu_3_dart_study/2025-04-03/solution1/repository/store_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('[ StoreRepository ] Mock Data - ', () {
    late StoreRepository repository;

    setUp(() {
      repository = StoreRepositoryImpl(MockStoreDataSource());
    });

    test('정확한 데이터 출력. Null 제거', () async {
      final stores = await repository.getAllStores();

      //remainStat, stockAt, createdAt null 제외 체크
      expect(stores.length, 2); // Mock 데이터 기준으로 2개 예상
      expect(stores.every((store) => store.name.isNotEmpty), true);
      expect(stores.every((store) => store.remainStat.isNotEmpty), true);

    });

    test('DTO와 Store mapping 체크', () async {
      final dto = StoreDto(
        addr: "Test Address",
        code: "12345",
        createdAt: "2020/07/03 11:00:00",
        lat: 37.62,
        lng: 127.01,
        name: "Test Store",
        remainStat: "plenty",
        stockAt: "2020/07/03 10:00:00",
        type: "01",
      );

      final store = dto.toStore();
      expect(store?.address ?? '', "Test Address");
      expect(store?.code ?? '', "12345");
      expect(store?.name ?? '', "Test Store");
    });

  });
}
