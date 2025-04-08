import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/store_dto.dart';
import '../model/store_remain_stat.dart';
import 'store_data_source.dart';

class StoreDataSourceImpl implements StoreDataSource {
  final http.Client _client; // 이게 정확히 무슨 역활을 하는건가?
  final String _url =
      'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json';
  StoreDataSourceImpl(this._client);

  @override
  Future<List<StoreDto>> getStoresMaskInfo() async {
    final response = await _client.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List<dynamic> storeList = json['stores'];

      return storeList
          .map((e) => StoreDto.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return throw Exception('Not Found ${response.statusCode}');
  }

  @override
  Future<void> deleteStore(int code) {
    return throw Exception('⚠️해당 기능을 지원되지 않습니다.\nMockAPI를 이용해주세요.');
  }

  @override
  Future<StoreDto> getStoreMaskInfo({required int code}) {
    return throw Exception('⚠️해당 기능을 지원되지 않습니다.\nMockAPI를 이용해주세요.');
  }

  @override
  Future<int> patchStoreMaskInfo({
    required int code,
    required StoreRemainStat remainStat,
    required String stockAt,
  }) {
    return throw Exception('⚠️해당 기능을 지원되지 않습니다.\nMockAPI를 이용해주세요.');
  }

  @override
  Future<int> postStoreInfo({
    required String addr,
    required String name,
    required double lat,
    required double lng,
  }) {
    return throw Exception('⚠️해당 기능을 지원되지 않습니다.\nMockAPI를 이용해주세요.');
  }
}
