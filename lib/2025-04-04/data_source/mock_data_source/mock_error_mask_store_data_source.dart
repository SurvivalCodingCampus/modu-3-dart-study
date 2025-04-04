// lib/2025-04-04/data_source/mock_photo_data_source_impl.dart
import 'dart:convert';

import '../../dto/photo_dto.dart';
import '../photo_data_source.dart';

class MockErrPhotoDataSourceImpl implements PhotoDataSource {
  @override
  Future<List<PhotoDto>> getPhotos() async {
    // Mock JSON response
    final response = '''
[
  {
    "id": "1",
    "type": "article",
    "title": "This is an article",
    "content": "This is the content of the article.",
    "created_at": "2020-01-01"
  },
  {
    "id": 2,
    "type": null,
    "url": "https://example.com/image.jpg",
    "caption": "This is an image.",
    "created_at": "2020-02-02"
  },
  {
    "id": 3,
    "url": "https://example.com/video.mp4",
    "caption": "This is a video.",
    "created_at": "2020-03-03"
  }
]
    ''';

    final List<dynamic> jsonData = json.decode(response);
    return jsonData.map((json) => PhotoDto.fromJson(json)).toList();
  }
}
