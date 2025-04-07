import 'dart:convert';

import 'package:modu_3_dart_study/2025-04-04/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/dto/store_dto.dart';
import 'package:http/http.dart' as http;

class StoreDataSourceImpl implements StoreDataSource {
  final String _url;

  const StoreDataSourceImpl({
    required String url,
  }) : _url = url;

  @override
  Future<List<StoreDto>> getStores() async {
    try {
      final response = await http.get(Uri.parse(_url));

      if(response.statusCode == 200) {
        final json = await jsonDecode(utf8.decode(response.bodyBytes));
        final List<dynamic> stores = json['stores'];

        return stores.map((e) => StoreDto.fromJson(e)).toList();
      } else {
        throw Exception('url 정보 로딩 실패');
      }
    } catch(e) {
      throw Exception('인터넷 연결 오류: $e');
    }
  }
}