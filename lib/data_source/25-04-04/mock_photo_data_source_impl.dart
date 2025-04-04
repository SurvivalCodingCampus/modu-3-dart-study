import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/data_source/25-04-04/photo_data_source.dart';
import 'package:modu_3_dart_study/dto/25-04-04/photo_dto.dart';

class MockPhotoDataSourceImpl implements PhotoDataSource {
  @override
  Future<List<PhotoDto>> getPhotos() async {
    const jsonData = ''' 
  [{
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

    final List<dynamic> data = json.decode(jsonData);
    return data.map((json) => PhotoDto.fromJson(json)).toList();
  }
}
