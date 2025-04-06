import 'dart:convert';

import 'package:modu_3_dart_study/2025-04-04/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/dto/photo_dto.dart';

class MockPhoto implements PhotoDataSource {
  @override
  Future<List<PhotoDto>> fetchPhotos() async {
    const mockJson = '''
    [
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
        "id": 4,
        "type": "invalid_type",
        "created_at": "2020-04-04"
      }
    ]
    ''';

    final List<dynamic> jsonList = jsonDecode(mockJson);
    return jsonList
        .map((item) => PhotoDto.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}