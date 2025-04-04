import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/assignments/2025-04-04/photo/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/dto/photo_dto.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final String _path;

  PhotoDataSourceImpl({required String path}) : _path = path;
  @override
  Future<List<PhotoDto>> getDtoPhotoList() async {
    try {
      final file = File(_path);
      if (!await file.exists()) {
        throw FileSystemException('파일을 찾을 수 없습니다', _path);
      }
      final String jsonString = await file.readAsString();
      final jsonList = jsonDecode(jsonString) as List;
      return jsonList
          .map((e) => e as Map<String, dynamic>)
          .map((e) => PhotoDto.fromJson(e))
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
