import 'dart:convert';

import 'package:http/http.dart' as http;

import 'mask_data_source.dart';

class MaskDataSourceImpl implements MaskDataSource {
  @override
  Future<Map<String, dynamic>> fetchData() async {
    final originData = await http.get(
      Uri.parse(
        'https://gist.githubusercontent'
        '.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json',
      ),
    );

    return jsonDecode(originData.body);
  }
}
