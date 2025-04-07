import 'package:modu_3_dart_study/2025-04-04/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/dto/store_list_dto.dart';
import 'package:modu_3_dart_study/2025-04-04/repository/store_repository_impl.dart';
import 'package:test/test.dart';

class MockStoreDataSourceImpl implements StoreDataSource {
  final Map<String, List<Map<String, dynamic>>> mockData = {
    "stores": [
      {
        "addr": "서울특별시 강북구 솔매로 38 (미아동)",
        "code": "11817488",
        "created_at": "2020/07/03 11:00:00",
        "lat": 37.6254369,
        "lng": 127.0164096,
        "name": "승약국",
        "remain_stat": "plenty",
        "stock_at": "2020/07/02 18:05:00",
        "type": "01",
      },
    ],
  };

  @override
  Future<StoreListDto> fetchStoreList() async {
    return StoreListDto.fromJson(mockData);
  }
}

void main() {
  group('StoreRepository 테스트', () {
    final mockDataSource = MockStoreDataSourceImpl();
    final repository = StoreRepositoryImpl(storeDataSource: mockDataSource);

    test('fetch해오는 StoreList는 Mock 데이터와 값이 같아야 한다', () async {
      final storeList = await repository.getStoreList();

      const index = 0;
      expect(storeList.stores.length, 1);
      expect(storeList.stores[index].addr, '서울특별시 강북구 솔매로 38 (미아동)');
    });
  });
}
