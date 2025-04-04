import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:modu_3_dart_study/2025-04/2025-04-04/data_source/inventory_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/dto/inventory_dto.dart';

class HttpInventoryDataSource implements InventoryDataSource {
  final http.Client _client;

  const HttpInventoryDataSource(this._client);

  @override
  Future<List<InventoryDto>> fetchInventories(String url) async {
    Uri uri = Uri.parse(url);

    final http.Response data = await _client.get(uri);
    List json = jsonDecode(data.body)["stores"];

    return json
        .cast<Map<String, dynamic>>()
        .map((e) => InventoryDto.fromJson(e))
        .toList();
  }
}
