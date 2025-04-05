import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/store_dto.dart';
import 'store_data_source.dart';

class StoreDataSourceImpl implements StoreDataSource {
  final urlApi =
      'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json';

  @override
  Future<List<StoreDto>> getStoresData() async {
    final response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List<dynamic> jsonList = json['stores'];
      return jsonList.map((e) => StoreDto.fromJson(e)).toList();
    } else {
      throw Exception('주소 파싱 오류');
    }
  }
}
