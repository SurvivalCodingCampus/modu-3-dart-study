import 'package:modu_3_dart_study/2025-04-04/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/dto/store_dto.dart';
import 'package:modu_3_dart_study/2025-04-04/model/store.dart';
import 'package:modu_3_dart_study/2025-04-04/repository/store_repository.dart';
import 'package:modu_3_dart_study/2025-04-04/repository/store_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  test('store 데이터 불러오기', () async {
    final StoreRepository storeRepository = StoreRepositoryImpl(
      storeDataSource: MockStoreDataSourceImpl(),
    );

    final List<Store> stores = await storeRepository.getStores();
    expect(stores.length, 2);
    expect(stores.first.name, "승약국");
    expect(stores.first.createAt, "2020/07/03 11:00:00");
    expect(stores.first.remainStat, "plenty");
    expect(stores.first.stockAt, "2020/07/02 18:05:00");
    expect(stores.first.code, "11817488");
  });
}

class MockStoreDataSourceImpl implements StoreDataSource {

  @override
  Future<List<StoreDto>> getStores() async {
    final jsonString = [
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
      {
        "addr": "서울특별시 강북구 삼양로 247 3층 (미아동)",
        "code": "12856941",
        "created_at": "2020/07/03 11:00:00",
        "lat": 37.6255182,
        "lng": 127.017747,
        "name": "대지약국",
        "remain_stat": "plenty",
        "stock_at": "2020/07/03 10:45:00",
        "type": "01",
      },
    ];

    return jsonString.map((e) => StoreDto.fromJson(e)).toList();
  }
}
