import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/store_dto.dart';
import 'store_data_source.dart';

class StoreDataSourceImpl implements StoreDataSource {
  @override
  Future<StoreDto> getStore(String code) async {
    final response = await getStores();
    return response.firstWhere((e) => e.code == code);
  }

  @override
  Future<List<StoreDto>> getStores() async {
    final response = await http.get(
      Uri.parse(
        'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json',
      ),
    );

    if (response.statusCode == 200) {
      final List datas = jsonDecode(response.body)['stores'];
      return datas.map((e) => StoreDto.fromJson(e)).toList();
    } else {
      throw Exception('데이터 불러오기 실패: ${response.statusCode}');
    }
  }
}
