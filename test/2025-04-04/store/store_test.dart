import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-04-04/store/data_source/impl/store_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-04/store/dto/store_dto.dart';
import 'package:modu_3_dart_study/2025-04-04/store/model/store.dart';
import 'package:modu_3_dart_study/2025-04-04/store/repository/impl/store_repository_impl.dart';
import 'package:modu_3_dart_study/2025-04-04/store/repository/store_repository.dart';
import 'package:test/test.dart';

void main() {
  group('마스크 상점 : ', () {
    late MockClient client;
    late StoreRepository storeRepository;
    const StoreDto dto = StoreDto.empty();
    setUpAll(() {
      client = MockClient((request) async {
        if (request.url.toString() == StoreDataSourceImpl.apiUrl) {
          return http.Response.bytes(
            utf8.encode(
              jsonEncode({
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
                  {
                    "addr": "서울특별시 강북구 삼양로 255 (미아동)",
                    "code": "11819723",
                    "created_at": "2020/07/03 11:00:00",
                    "lat": 37.6261612,
                    "lng": 127.0180494,
                    "name": "청구약국",
                    "stock_at": "2020/07/03 10:40:00",
                    "type": "01",
                  },
                ],
              }),
            ),
            200,
          );
        } else {
          return http.Response(jsonEncode([]), 404);
        }
      });
      storeRepository = StoreRepositoryImpl(
        StoreDataSourceImpl(dto, client: client),
        dto,
      );
    });
    test(' 조건 조회 ', () async {
      List<Store> stores = await storeRepository.query(
        (s) =>
            s.remainStat != '정보 없음' &&
            s.createdAt != DateTime(1970, 1, 1) &&
            s.stockAt != DateTime(1970, 1, 1),
      );

      expect(stores.length, 2);
    });
    test(' 전체 조회 ', () async {
      List<Store> stores = await storeRepository.getItems();

      expect(stores.length, 3);
    });
  });
}
