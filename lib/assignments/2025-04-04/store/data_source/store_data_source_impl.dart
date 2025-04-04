import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/assignments/2025-04-04/store/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/store/dto/store_dto.dart';

class StoreDataSourceImpl implements StoreDataSource {
  final String _path = 'lib/assignments/2025-04-04/store/data/mask.json';

  @override
  Future<List<StoreDto>> getDtoStores() async {
    final String jsonString = await File(_path).readAsString();
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    final List storesMap = jsonMap["stores"];
    return storesMap.map((e) => e as Map<String, dynamic>).map((e) => StoreDto.fromJson(e),).toList();

  }
}

