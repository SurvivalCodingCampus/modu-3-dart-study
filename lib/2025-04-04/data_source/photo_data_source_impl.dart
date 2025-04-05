import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04-04/data_source/photo_data_source.dart';

import '../dto/photo_dto.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final String _path;

  @override
  String get path => _path;

  const PhotoDataSourceImpl({required String path}) : _path = path;

  @override
  Future<List<PhotoDto>> fetchPhotos() async {
    final file = File(path);

    if (await file.exists()) {
      final jsonString = await file.readAsString();
      // 비표준 따옴표을 표준 따옴표로 변환
      final String processedJsonString = jsonString
          .replaceAll('“', '"')
          .replaceAll('”', '"');
      final List<dynamic> json = jsonDecode(processedJsonString);
      return json.map((e) {
        print(e);
        return PhotoDto.fromJson(e);
      }).toList();
    } else {
      throw PathNotFoundException(_path, OSError('File not found'));
    }
  }
}