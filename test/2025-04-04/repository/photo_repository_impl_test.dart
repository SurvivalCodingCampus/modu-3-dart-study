import 'package:modu_3_dart_study/2025-04-04/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/dto/photo_dto.dart';
import 'package:modu_3_dart_study/2025-04-04/model/photo.dart';
import 'package:modu_3_dart_study/2025-04-04/repository/photo_repository.dart';
import 'package:modu_3_dart_study/2025-04-04/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  test('photo 데이터 불러오기', () async {
    final PhotoRepository photoRepository = PhotoRepositoryImpl(
      photoDataSource: MockPhotoDataSourceImpl(),
    );

    final List<Photo> photos = await photoRepository.getPhotos();
    expect(photos.length, 3);
    expect(photos.every((e) => e.createdAt.runtimeType == DateTime), isTrue);
    expect(photos.every((e) => e.type.runtimeType == Type), isTrue);
    expect(photos.every((e) => e.id.runtimeType == int), isTrue);
  });
}

class MockPhotoDataSourceImpl implements PhotoDataSource {

  @override
  Future<List<PhotoDto>> getPhotos() async {
    final jsonString = [
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
    ];

    return jsonString.map((e) => PhotoDto.fromJson(e)).toList();
  }
}