import 'package:modu_3_dart_study/2025-04-04/exam/exam_02/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/exam/exam_02/dto/photo_dto.dart';

class MockPhotoDataSourceImpl implements PhotoDataSource {
  @override
  Future<List<PhotoDto>> getPhotoDtoList() async {
    final jsonList = [
      {
        "id": "1",
        "type": "article",
        "title": "This is an article",
        "content": "This is the content of the article.",
        "created_at": "2020-01-01",
      },
      {
        "id": 2,
        "type": null,
        "url": "https://example.com/image.jpg",
        "caption": "This is an image.",
        "created_at": "2020-02-02",
      },
      {
        "id": 3,
        "url": "https://example.com/video.mp4",
        "caption": "This is a video.",
        "created_at": "2020-03-03",
      },
    ];
    return jsonList.map((e) => PhotoDto.fromJson(e)).toList();
  }
}
