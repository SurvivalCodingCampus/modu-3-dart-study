import 'dart:convert';
import 'dart:io';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modu_3_dart_study/2025-04-04/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/dto/photo_dto.dart';
import 'package:modu_3_dart_study/2025-04-04/model/enum/photo_type.dart';
import 'package:modu_3_dart_study/2025-04-04/repository/photo_repository.dart';
import 'package:modu_3_dart_study/2025-04-04/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

import 'photo_repository_test.mocks.dart';

@GenerateMocks([PhotoDataSource])
void main() {
  const mockJsonString = '''
  [
  {
    "id": 1,
    "type": "article",
    "title": "This is an article",
    "content": "This is the content of the article.",
    “created_at”: “2020-01-01”
  },
  {
    "id": 2,
    "type": "image",
    "url": "https://example.com/image.jpg",
    "caption": "This is an image.",
    “created_at”: “2020-02-02”
  },
  {
    "id": 3,
    "type": "video",
    "url": "https://example.com/video.mp4",
    "caption": "This is a video.",
    “created_at”: “2020-03-03”
  },
  {
    "id": “1”,
    "type": "article",
    "title": "This is an article",
    "content": "This is the content of the article.",
    “created_at”: “2020-01-01”
  },
  {
    "id": 2,
    "type": null,
    "url": "https://example.com/image.jpg",
    "caption": "This is an image.",
    “created_at”: “2020-02-02”
  },
  {
    "id": 3,

    "url": "https://example.com/video.mp4",
    "caption": "This is a video.",
    “created_at”: “2020-03-03”
  }
]
  ''';
  PhotoDataSource mockDataSource = MockPhotoDataSource();
  PhotoRepository repository = PhotoRepositoryImpl(dataSource: mockDataSource);

  final String processedJsonString = mockJsonString
      .replaceAll('“', '"')
      .replaceAll('”', '"');
  final List<dynamic> json = jsonDecode(processedJsonString);
  final List<PhotoDto> photoDtos =
      json.map((e) => PhotoDto.fromJson(e)).toList();

  when(mockDataSource.fetchPhotos()).thenAnswer((_) async => photoDtos);

  group('photoRepository 테스트', () {
    test('getPhotos()는 PhotoDataSource의 fetchPhotos를 정상적으로 호출한다.', () async {
      verifyNever(mockDataSource.fetchPhotos());
      await repository.getPhotos();
      verify(mockDataSource.fetchPhotos()).called(1);
    });

    test('photos를 도메인 모델로 올바르게 타입 변환이 된다.', () async {
      final photos = await repository.getPhotos();

      expect(photos[0].id, isA<String>());
      expect(photos[0].type, isA<PhotoType>());
      expect(photos[0].title, isA<String>());
      expect(photos[0].content, isA<String>());
      expect(photos[0].url, isA<String>());
      expect(photos[0].caption, isA<String>());
      expect(photos[0].createdAt, isA<DateTime>());
    });

    test(
      'PhotoDataSource에서 path가 올바르지 않으면 PhotoRepository에서 getPhotos() 호출 시 PathNotFoundException이 발생한다.',
      () async {
        const path = 'invalid_path';
        const pathNotFoundException = PathNotFoundException(
          path,
          OSError('invalid path'),
        );

        when(mockDataSource.path).thenReturn(path);
        when(mockDataSource.fetchPhotos()).thenThrow(pathNotFoundException);

        expect(
          () async => await repository.getPhotos(),
          throwsA(isA<PathNotFoundException>()),
        );
      },
    );
  });
}
