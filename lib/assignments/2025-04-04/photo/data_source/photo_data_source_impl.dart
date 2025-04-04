import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/assignments/2025-04-04/photo/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/dto/photo_dto.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final String _path;

  PhotoDataSourceImpl({required String path}) : _path = path;
  @override
  Future<List<PhotoDto>> getDtoPhotoList() async {
    final String jsonString = await File(_path).readAsString();
    final jsonList = jsonDecode(jsonString) as List;
    return jsonList.map((e) => e as Map<String, dynamic>).map((e) => PhotoDto.fromJson(e),).toList();
  }
}
