import 'dart:convert';
import 'dart:io';

import 'package:http/testing.dart';

import '../data_source/mask_store_data_source.dart';
import '../dto/mask_store_dto.dart';

import 'package:http/http.dart' as http;

class MockMaskStoreDataSourceImpl implements MaskStoreDataSource {
  final apiUrl =
      'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json';
  @override
  Future<List<MaskStoreDto>> getStoresDto() async {
    final client = MockClient((request) async {
      if (request.url.toString() == 'https://maskstore.com/') {
        return http.Response(
          jsonEncode([
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
              "remain_stat": "plenty",
              "stock_at": "2020/07/03 10:40:00",
              "type": "01",
            },
          ]),
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
        );
      }
      return http.Response('Not Found', 404);
    });

    final response = await client.get(Uri.parse('https://maskstore.com/'));

    final List<dynamic> stores = jsonDecode(response.body);

    return stores.map((e) => MaskStoreDto.fromJson(e)).toList();
  }
}
