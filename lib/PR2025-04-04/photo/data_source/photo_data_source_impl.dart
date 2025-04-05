import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/PR2025-04-04/photo/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/PR2025-04-04/photo/dto/photo_dto.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  @override
  Future<List<PhotoDto>> getPhotosData() async {
    final String jsonFilePath = 'lib/PR2025-04-04/photo/json/photo.json';
    final File file = File(jsonFilePath);
    final jsonFile = await file.readAsString();
    List<dynamic> json = jsonDecode(jsonFile);
    final jsonList = json.map((e) => PhotoDto.fromJson(e)).toList();
    return jsonList;
  }
}
