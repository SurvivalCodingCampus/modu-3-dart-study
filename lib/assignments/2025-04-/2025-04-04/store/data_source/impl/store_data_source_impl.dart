import 'dart:convert';

import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/common/model/api_resp.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/store/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/store/dto/store_dto.dart';
import 'package:http/http.dart' as http;

class StoreDataSourceImpl implements StoreDataSource {
  @override
  Future<List<StoreDto>> fetchStores() async {
    final url =
        'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json';
    final resp = await http.get(Uri.parse(url));
    final jsonDecoded = jsonDecode(resp.body);
    final jsonList = ApiResp.fromJson(jsonDecoded).stores;
    final storeDtoes = jsonList.map((e) => StoreDto.fromJson(e)).toList();
    return storeDtoes;
  }
}
