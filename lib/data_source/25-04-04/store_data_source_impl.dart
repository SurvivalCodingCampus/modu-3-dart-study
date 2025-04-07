import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/data_source/25-04-04/store_data_source.dart';

import '../../dto/25-04-04/store_dto.dart';

class StoreDataSourceImpl implements StoreDataSource {
  final http.Client client;
  StoreDataSourceImpl({http.Client? client}) : client = client ?? http.Client();

  @override
  Future<List<StoreDto>> getStores() async {
    final response = await client.get(
      Uri.parse(
        'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json',
      ),
    );
    if (response.statusCode == 200) {
      // final decoded = utf8.decode(response.bodyBytes);
      return (jsonDecode(response.body) as List)
          .map((json) => StoreDto.fromJson(json))
          .toList();
    } else {
      throw ('로드 실패');
    }
  }
}
