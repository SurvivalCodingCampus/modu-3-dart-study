import 'dart:convert';
import 'dart:typed_data';

import 'package:modu_3_dart_study/2025-04-04/store/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/store/dto/store_dto.dart';

class StoreDataSourceImpl extends StoreDataSource {
  static const String apiUrl =
      'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json';

  StoreDataSourceImpl(StoreDto dto, {super.client}) : super(apiUrl, dto);

  @override
  Future<List<StoreDto>> getItems() async {
    final httpData = await super.client.get(Uri.parse(httpUrl));
    if (httpData.statusCode == 200) {
      final Uint8List httpBody = httpData.bodyBytes;
      final Map<String, dynamic> httpJson = jsonDecode(utf8.decode(httpBody));
      final List<dynamic> result = httpJson['stores'];

      return result
          .map((e) => super.dto.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}
