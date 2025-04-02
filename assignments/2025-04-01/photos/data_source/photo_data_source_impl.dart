import 'dart:convert';
import 'dart:io';
import 'package:modu_3_dart_study/PR2025-04-01/photos/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/PR2025-04-01/photos/model/photo.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final String path = 'lib/PR2025-04-01/photos/assets/photos.json';

  Future<List<Photo>> getPhotos() async {
    final file = File(path);
    //json 파일 읽어오기
    final jsonContents = await file.readAsString();
    //List<Map<String, dynamic>> 으로 변환
    List<dynamic> listContents = jsonDecode(jsonContents);
    // 위의 컨텐츠를 Photo 리스트 형식으로 변환
    return listContents.map((e) => Photo.fromJson(e)).toList();
  }
}
