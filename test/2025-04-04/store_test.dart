import 'dart:io';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

import '../../assignments/2025-04-04/data_source/mock/mock_store_data_source_impl.dart';
import '../../assignments/2025-04-04/model/store_remain_stat.dart';
import '../../assignments/2025-04-04/repository/store_repository_impl.dart';

void main() {
  group('약국 데이터 테스트', () {
    test('약국 목록(성공)', () async {
      final httpClient = http.Client();
      final dataSource = MockStoreDataSourceImpl(httpClient);
      final repository = StoreRepositoryImpl(dataSource);
      final stores = await repository.getStores();

      expect(stores, isNotEmpty);

      final store0 = stores[0];
      expect(store0.code, 1);
      expect(store0.name, '승약국');
      expect(store0.addr, '서울특별시 강북구 솔매로 38 (미아동)');
      expect(store0.lat, 37.6254369);
      expect(store0.lng, 127.0164096);
      expect(store0.remainStat, StoreRemainStat.some);
      expect(store0.stockAt, DateTime.parse('2020-07-02 18:05:00.000'));
      expect(store0.createdAt, DateTime.parse('2020-07-03 11:00:00.000'));

      final store1 = stores[1];
      expect(store1.code, 2);
      expect(store1.name, '대지약국');
      expect(store1.remainStat, StoreRemainStat.break_);
      expect(store1.stockAt, DateTime.parse('2020-07-03 10:45:00.000'));

      final store2 = stores[2];
      expect(store2.code, 3);
      expect(store2.name, '청구약국');
      expect(store2.createdAt, isNull);
      expect(store2.remainStat, StoreRemainStat.plenty);

      final store3 = stores[3];
      expect(store3.code, 4);
      expect(store3.name, '민들레약국');
      expect(store3.createdAt, isNull);
      expect(store3.remainStat, isNull);
      expect(store3.stockAt, isNull);

      final store4 = stores[4];
      expect(store4.code, 5);
      expect(store4.name, '수유대학약국');
      expect(store4.remainStat, StoreRemainStat.empty);
      expect(store4.stockAt, DateTime.parse('2020-06-30 17:43:00.000'));
    });

    test('약국 하나(성공)', () async {
      final httpClient = http.Client();
      final dataSource = MockStoreDataSourceImpl(httpClient);
      final repository = StoreRepositoryImpl(dataSource);
      final store = await repository.getStore(1);

      expect(store.code, 1);
      expect(store.name, '승약국');
      expect(store.addr, '서울특별시 강북구 솔매로 38 (미아동)');
      expect(store.lat, 37.6254369);
      expect(store.lng, 127.0164096);
      expect(store.remainStat, StoreRemainStat.some);
      expect(store.stockAt, DateTime.parse('2020-07-02 18:05:00.000'));
      expect(store.createdAt, DateTime.parse('2020-07-03 11:00:00.000'));
    });

    test('약국 하나(실패) - 없는 code (404)', () async {
      final httpClient = http.Client();
      final dataSource = MockStoreDataSourceImpl(httpClient);
      final repository = StoreRepositoryImpl(dataSource);
      expect(
        () async => await repository.getStore(99999),
        throwsA(
          isA<HttpException>().having(
            (e) => e.message,
            'message',
            contains('404'),
          ),
        ),
      );
    });

    test('약국 추가(성공)', () async {
      final httpClient = http.Client();
      final dataSource = MockStoreDataSourceImpl(httpClient);
      final repository = StoreRepositoryImpl(dataSource);
      final store = await repository.createStore(
        addr: '서울시',
        name: '지롱약국',
        lat: 37.12345,
        lng: 127.12345,
      );

      expect(store.name, '지롱약국');
      expect(store.addr, '서울시');
      expect(store.lat, 37.12345);
      expect(store.lng, 127.12345);
      expect(store.code, isA<int>());
      expect(store.createdAt, isA<DateTime>());
    });

    test('약국 추가(실패) - name 누락', () async {
      final httpClient = http.Client();
      final dataSource = MockStoreDataSourceImpl(httpClient);
      final repository = StoreRepositoryImpl(dataSource);
      expect(
        () async => await repository.createStore(
          addr: '서울시',
          name: '', // 빈 문자열
          lat: 37.12345,
          lng: 127.12345,
        ),
        throwsA(
          isA<HttpException>().having(
            (e) => e.message,
            'message',
            contains('400'),
          ),
        ),
      );
    });

    test('마스크 정보 업데이트(성공)', () async {
      final httpClient = http.Client();
      final dataSource = MockStoreDataSourceImpl(httpClient);
      final repository = StoreRepositoryImpl(dataSource);
      final store = await repository.updateMaskStat(
        code: 6,
        remainStat: StoreRemainStat.few,
        stockAt: '2025/04/05 21:30:00',
      );

      expect(store.code, 6);
      expect(store.remainStat, StoreRemainStat.few);
      expect(store.stockAt, DateTime.parse('2025-04-05 21:30:00.000'));
      expect(store.name, isNotEmpty);
      expect(store.addr, isNotEmpty);
    });

    test('약국 삭제 후 조회 시 예외 발생', () async {
      final httpClient = http.Client();
      final dataSource = MockStoreDataSourceImpl(httpClient);
      final repository = StoreRepositoryImpl(dataSource);
      final int targetCode = 6;

      await repository.deleteStore(targetCode);

      expect(
        () async => await repository.getStore(targetCode),
        throwsA(
          predicate(
            (e) => e is HttpException && e.toString().contains('404 Not Found'),
          ),
        ),
      );
    });
  });
}
