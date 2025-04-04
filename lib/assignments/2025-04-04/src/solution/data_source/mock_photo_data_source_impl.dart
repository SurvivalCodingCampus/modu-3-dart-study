import 'dart:convert';

import '../dto/photo_dto.dart';
import 'photo_data_source.dart';

class MockPhotoDataSourceImpl implements PhotoDataSource {
  final mockData = '''[
    {
      "id": 1,
      "type": "article",
      "title": "This is an article",
      "content": "This is the content of the article.",
      "created_at": "2020-01-01"
    },
    {
      "id": 2,
      "type": "image",
      "url": "https://example.com/image.jpg",
      "caption": "This is an image.",
      "created_at": "2020-02-02"
    },
    {
      "id": 3,
      "type": "video",
      "url": "https://example.com/video.mp4",
      "caption": "This is a video.",
      "created_at": "2020-03-03"
    },
    {
      "id": "4",
      "type": "",
      "title": "This is an article",
      "content": "This is the content of the article.",
      "created_at": "2020-01-05"
    },
    {
      "id": 5,
      "type": null,
      "url": "https://example.com/image.jpg",
      "caption": "This is an image.",
      "created_at": "2020-02-05"
    },
    {
      "id": 6,
      "url": "https://example.com/video.mp4",
      "caption": "This is a video.",
      "created_at": "2020-03-05"
    }
  ]''';
  @override
  Future<PhotoDto> getPhoto(id) async {
    final response = await getPhotos();
    return response.firstWhere((e) => e.id == id);
  }

  @override
  Future<List<PhotoDto>> getPhotos() async {
    final List response = jsonDecode(mockData);
    final result = List<Map<String, dynamic>>.from(response);
    return result.map((e) => PhotoDto.fromJson(e)).toList();
  }
}
