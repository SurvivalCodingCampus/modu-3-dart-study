import 'package:modu_3_dart_study/2025-04-03/solution2/data_sourece/photo_data_source.dart';

class MockPhotoDataSourceImpl implements PhotoDataSource {

  static const _mockData = [
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
      "created_at" : "2020-02-02"
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
      "type": "article",
      "title": "This is an article",
      "content": "This is the content of the article.",
      "created_at": "2020-01-01"
    },
    {
      "id": 5,
      "type": null,
      "url": "https://example.com/image.jpg",
      "caption": "This is an image.",
      "created_at": "2020-02-02"
    },
    {
      "id": 6,
      "url": "https://example.com/video.mp4",
      "caption": "This is a video.",
      "created_at": "2020-03-03"
    }
  ];

  @override
  Future<List<Map<String, dynamic>>> readAllPhotos() async {
    return _mockData;
  }
}
