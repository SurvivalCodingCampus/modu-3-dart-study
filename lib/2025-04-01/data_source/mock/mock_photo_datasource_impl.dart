import 'dart:convert';
import '../photo_datasource.dart';

class MockPhotoDatasourceImpl implements PhotoDatasource {
  static const String _mockJsonString = r'''
[
  {
    "albumId": 1,
    "id": 1,
    "title": "고양이 사진 모음",
    "url": "https://placekitten.com/600/600",
    "thumbnailUrl": "https://placekitten.com/150/150"
  },
  {
    "albumId": 1,
    "id": 2,
    "title": "고양이 사료 먹방",
    "url": "https://placekitten.com/601/601",
    "thumbnailUrl": "https://placekitten.com/151/151"
  },
  {
    "albumId": 1,
    "id": 3,
    "title": "고양이 낮잠 스페셜",
    "url": "https://placekitten.com/602/602",
    "thumbnailUrl": "https://placekitten.com/152/152"
  },
  {
    "albumId": 2,
    "id": 4,
    "title": "강아지 산책 컬렉션",
    "url": "https://placedog.net/600/600",
    "thumbnailUrl": "https://placedog.net/150/150"
  },
  {
    "albumId": 2,
    "id": 5,
    "title": "강아지 웃음 특집",
    "url": "https://placedog.net/601/601",
    "thumbnailUrl": "https://placedog.net/151/151"
  }
]
  ''';

  @override
  Future<List<Map<String, dynamic>>> fetchPhotos() async {
    final List<dynamic> decoded = json.decode(_mockJsonString);
    return decoded.map((e) => Map<String, dynamic>.from(e)).toList();
  }
}
