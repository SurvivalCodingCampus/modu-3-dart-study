import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/photo/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/photo/dto/photo_dto.dart';

class MockPhotoDataSourceImpl implements PhotoDataSource {
  @override
  Future<List<PhotoDto>> fetchPhotos() async {
    return [
      PhotoDto(
        id: 1,
        type: 'article',
        url: 'https://example.com/image.jpg',
        content: 'This is the content of the article.',
        createdAt: '2020-01-01',
      ),
      PhotoDto(
        id: '2',
        type: null,
        url: 'https://example.com/image.jpg',
        content: 'This is the content of the article?',
        createdAt: '2020-01-01',
      ),
      PhotoDto(
        id: 3,
        type: 'image',
        url: 'https://example.com/image.jpg',
        content: 'This is the content of the article!',
        createdAt: '2020-01-01',
      ),
      PhotoDto(
        id: 4,
        type: 'video',
        url: 'https://example.com/image.jpg',
        content: 'This is the content of the article@',
        createdAt: '2020-01-01',
      ),
    ];
  }
}
