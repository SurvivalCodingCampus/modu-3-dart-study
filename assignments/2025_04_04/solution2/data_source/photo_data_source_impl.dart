import 'dart:convert';
import 'dart:io';

import '../dto/photo_dto.dart';
import 'photo_data_source.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final jsonMockFile = File(
    'C:/Users/Ujun/modu-3-dart-study/assignments/2025_04_04/solution2/data/mock_2.json',
  );
  @override
  Future<List<PhotoDto>> getPhotos() async {
    final jsonString = await jsonMockFile.readAsString();

    final List photoJson = await jsonDecode(jsonString);

    return photoJson.map((e) => PhotoDto.fromJson(e)).toList();
  }
}
