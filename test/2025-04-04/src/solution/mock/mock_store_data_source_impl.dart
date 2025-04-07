import 'dart:convert';

import 'package:modu_3_dart_study/assignments/2025-04-04/src/solution/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/src/solution/dto/store_dto.dart';

class MockStoreDataSourceImpl implements StoreDataSource {
  final mockData = '''
[
  {
    "addr": "서울특별시 강북구 솔매로 38 (미아동)",
    "code": "11817488",
    "created_at": "2020/07/03 11:00:00",
    "lat": 37.6254369,
    "lng": 127.0164096,
    "name": "승약국",
    "remain_stat": "plenty",
    "stock_at": "2020/07/02 18:05:00",
    "type": "01"      
  },
  {
    "addr": "서울특별시 강북구 삼양로 247 3층 (미아동)",
    "code": "12856941",
    "created_at": null,
    "lat": 37.6255182,
    "lng": 127.017747,
    "name": "대지약국",
    "remain_stat": "plenty",
    "stock_at": "2020/07/03 10:45:00",
    "type": "01"
  },
  {
    "addr": "서울특별시 강북구 삼양로 255 (미아동)",
    "code": "11819723",
    "created_at": "2020/07/03 11:00:00",
    "lat": 37.6261612,
    "lng": 127.0180494,
    "name": "청구약국",
    "remain_stat": null,
    "stock_at": "2020/07/03 10:40:00",
    "type": "01"
  },
  {
    "addr": "서울특별시 강북구 덕릉로 42 1층 (수유동)",
    "code": "11886374",
    "created_at": "2020/07/03 11:00:00",
    "lat": 37.634082,
    "lng": 127.018248,
    "name": "수유프라자약국",
    "remain_stat": "plenty",
    "stock_at": null,
    "type": "01"
    },
  {
    "addr": "서울특별시 강북구 삼양로 429 (수유동)",
    "code": "11818328",
    "created_at": null,
    "lat": 37.6418221,
    "lng": 127.0165334,
    "name": "대명약국",
    "remain_stat": null,
    "stock_at": null,
    "type": "01"
  }
]''';
  @override
  Future<StoreDto> getStore(String code) async {
    final response = await getStores();
    try {
      return response.firstWhere((e) => e.code == code);
    } catch (e) {
      throw Exception('코드가 $code인 Store을 찾을 수 없습니다');
    }
  }

  @override
  Future<List<StoreDto>> getStores() async {
    final List response = await jsonDecode(mockData);

    return response.map((e) => StoreDto.fromJson(e)).toList();
  }
}
