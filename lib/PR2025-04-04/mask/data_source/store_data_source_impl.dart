import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/PR2025-04-04/mask/data_source/store_data_source.dart';

import '../dto/store_dto.dart';

class StoreDataSourceImpl implements StoreDataSource {
  final urlApi =
      'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json';

  @override
  Future<List<StoreDto>> getStoresData() async {
    final response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      // API 응답 body를 JSON 문자열에서 Map<String, dynamic> 형태로 디코딩
      final Map<String, dynamic> json = jsonDecode(response.body);
      // 디코딩된 json을 stores라는 리스트의 형태로 변환
      final List<dynamic> jsonList = json['stores'];
      // jsonList의 각 항목(Map<String, dynamic>)을 StoreDto 객체로 변환하여 리스트로 반환
      return jsonList.map((e) => StoreDto.StoreDtofromJson(e)).toList();
    } else {
      throw Exception('주소 파싱 오류');
    }
  }
}
