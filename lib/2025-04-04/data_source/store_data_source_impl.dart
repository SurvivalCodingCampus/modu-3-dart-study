import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04-04/data_source/store_data_source.dart';

import '../dto/store_list_dto.dart';

class StoreDataSourceImpl implements StoreDataSource {
  @override
  Future<StoreListDto> fetchStoreList() async {
    final jsonString =
        await File('lib/2025-04-04/data/mask_store.json').readAsString();
    final json = jsonDecode(jsonString);
    return StoreListDto.fromJson(json);
  }
}
