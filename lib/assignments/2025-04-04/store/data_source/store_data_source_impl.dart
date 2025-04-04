import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/assignments/2025-04-04/store/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/store/dto/store_dto.dart';

class StoreDataSourceImpl implements StoreDataSource {
  final String _path = 'lib/assignments/2025-04-04/store/data/mask.json';

  @override
  Future<List<StoreDto>> getDtoStores() async {
    try {
      final file = File(_path);
      if (!await file.exists()) {
        throw FileSystemException('파일을 찾을 수 없습니다', _path);
      }
      final String jsonString = await file.readAsString();
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final List storesMap = jsonMap["stores"];
      return storesMap
          .map((e) => e as Map<String, dynamic>)
          .map((e) => StoreDto.fromJson(e))
          .toList();
    } catch (e) {
      if (e is FileSystemException) {
        rethrow;
      } else if (e is FormatException) {
        throw FormatException('JSON 형식이 올바르지 않습니다: ${e.message}', _path);
      }
      throw Exception('데이터를 가져오는 중 오류가 발생했습니다: $e');
    }
  }
}
