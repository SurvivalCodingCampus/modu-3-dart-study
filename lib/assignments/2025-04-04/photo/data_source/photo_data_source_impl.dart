import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/assignments/2025-04-04/photo/data_source/photo_data_source.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final String _path;

  PhotoDataSourceImpl({required String path}) : _path = path;
  @override
  Future<List<Map<String, dynamic>>> getPhotoList() async {
    final String jsonString = await File(_path).readAsString();
    final jsonList = jsonDecode(jsonString) as List;
    return jsonList.map((e) => e as Map<String, dynamic>).toList();
  }
}
