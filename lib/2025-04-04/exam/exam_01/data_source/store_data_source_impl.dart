import 'dart:convert';

import 'package:modu_3_dart_study/2025-04-04/exam/exam_01/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/exam/exam_01/dto/stores_result_dto.dart';

import 'package:http/http.dart' as http;

class StoreDataSourceImpl implements StoreDataSource {
  final String _baseUrl =
      'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31';
  final http.Client _client;

  StoreDataSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  @override
  Future<StoresResultDto> getStoresResultDto() async {
    final response = await _client.get(Uri.parse('$_baseUrl/mask_store.json'));
    return StoresResultDto.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }
}
