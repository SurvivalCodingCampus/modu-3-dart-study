import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/assignments/2025-04-04/mask/data_source/mask_data_source.dart';

class MaskDataSourceImpl implements MaskDataSource {
  static final String _path = 'lib/assignments/2025-04-04/mask/data/mask.json';

  @override
  Future<List<Map<String, dynamic>>> getStores() async {
    String jsonString = await File(_path).readAsString();
    final jsonMap = jsonDecode(jsonString) as Map;
    final stores = jsonMap["stores"] as List;
    return stores.map((e) => e as Map<String, dynamic>).toList();
  }
}
