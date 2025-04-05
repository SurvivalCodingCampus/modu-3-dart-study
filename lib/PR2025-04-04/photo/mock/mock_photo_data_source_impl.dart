import 'package:modu_3_dart_study/PR2025-04-04/photo/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/PR2025-04-04/photo/dto/photo_dto.dart';

import '../enum/photo_enum.dart';

class MockPhotoDataSourceImpl implements PhotoDataSource {
  @override
  Future<List<PhotoDto>> getPhotosData() async {
    return [
      PhotoDto(
        id: 1,
        type: PhotoEnum.Article,
        title: "This is an article",
        content: "This is the content of the article.",
        created_at: "2020-01-01",
      ),
      PhotoDto(
        id: 2,
        type: PhotoEnum.Image,
        url: "https://example.com/image.jpg",
        caption: "This is an image.",
        created_at: "2020-02-02",
      ),
      PhotoDto(
        id: 3,
        type: PhotoEnum.Video,
        url: "https://example.com/video.mp4",
        caption: "This is a video.",
        created_at: "2020-03-03",
      ),
      PhotoDto(
        id: int.tryParse("1") ?? 1,
        // 문자열 id 변환
        type: PhotoEnum.Article,
        title: "This is an article",
        content: "This is the content of the article.",
        created_at: "2020-01-01",
      ),
      PhotoDto(
        id: 2,
        type: null,
        // type이 null인 경우
        url: "https://example.com/image.jpg",
        caption: "This is an image.",
        created_at: "2020-02-02",
      ),
      PhotoDto(
        id: 3,
        type: null,
        // type이 누락된 경우
        url: "https://example.com/video.mp4",
        caption: "This is a video.",
        created_at: "2020-03-03",
      ),
    ];
  }
}
