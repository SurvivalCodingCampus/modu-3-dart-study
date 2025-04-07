import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-04/exam1/data_source/stores_data_source.dart';

import '../dto/stores_dto.dart';

class StoresDataSourceImpl implements StoresDataSource {
  final http.Client client;

  StoresDataSourceImpl(this.client);

  @override
  Future<List<StoresDto>> fetchStores() async {
    final http.Response response = await client.get(
      Uri.parse(
        'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json',
      ),
    );
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => StoresDto.fromJson(data))
          .toList();
    } else {
      throw Exception('failed to StoresDtd');
    }
  }
}
