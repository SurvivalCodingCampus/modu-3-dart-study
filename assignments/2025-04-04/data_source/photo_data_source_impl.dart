import 'dart:convert';
import 'dart:io';

import '../../2025-04-04/data_source/photo_data_source.dart';
import '../dto/photo_dto.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final String filePath = 'assignments/2025-04-04/json/photo.json';

  @override
  Future<List<PhotoDto>> getPhotoDataDto() async {
    final file = File(filePath);
    final fileString = await file.readAsString();
    final List<dynamic> fileJson = jsonDecode(fileString);
    return fileJson.map((e) => PhotoDto.fromJson(e)).toList();
  }
}
