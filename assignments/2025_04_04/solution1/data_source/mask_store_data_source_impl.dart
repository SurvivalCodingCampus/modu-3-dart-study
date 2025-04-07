import 'dart:convert';

import '../dto/mask_store_dto.dart';
import 'mask_store_data_source.dart';

import 'package:http/http.dart' as http;

class MaskStoreDataSourceImpl implements MaskStoreDataSource {
  final apiUrl =
      'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json';
  @override
  Future<List<MaskStoreDto>> getStoresDto() async {
    final response = await http.get(Uri.parse(apiUrl));

    final Map<String, dynamic> stores = jsonDecode(response.body);
    final List<dynamic> resultMaskList = stores['stores'];

    return resultMaskList.map((e) => MaskStoreDto.fromJson(e)).toList();
  }
}
