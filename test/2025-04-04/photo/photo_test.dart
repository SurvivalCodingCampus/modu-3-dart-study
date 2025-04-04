import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-04-04/photo/data_source/impl/photo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-04/photo/dto/photo_dto.dart';
import 'package:modu_3_dart_study/2025-04-04/photo/model/photo.dart';
import 'package:modu_3_dart_study/2025-04-04/photo/repository/impl/photo_repository_impl.dart';
import 'package:modu_3_dart_study/2025-04-04/photo/repository/photo_repository.dart';
import 'package:test/test.dart';

void main() {
  group(' 사진 : ', () {
    late MockClient client;
    late PhotoRepository photoRepository;
    const PhotoDto dto = PhotoDto.empty();

    setUpAll(() {
      client = MockClient((request) async {
        if (request.url.toString() == PhotoDataSourceImpl.apiUrl) {
          return http.Response.bytes(
            utf8.encode(
              jsonEncode({
                "results": [
                  {
                    "id": 1,
                    "type": "article",
                    "title": "This is an article",
                    "content": "This is the content of the article.",
                    'created_at': '2020-01-01',
                  },
                  {
                    "id": 2,
                    "type": "image",
                    "url": "https://example.com/image.jpg",
                    "caption": "This is an image.",
                    'created_at': '2020-02-02',
                  },
                  {
                    "id": 3,
                    "type": "video",
                    "url": "https://example.com/video.mp4",
                    "caption": "This is a video.",
                    'created_at': '2020-03-03',
                  },
                  {
                    "id": '1',
                    "type": "article",
                    "title": "This is an article",
                    "content": "This is the content of the article.",
                    'created_at': '2020-01-01',
                  },
                  {
                    "id": 2,
                    "type": null,
                    "url": "https://example.com/image.jpg",
                    "caption": "This is an image.",
                    'created_at': '2020-02-02',
                  },
                  {
                    "id": 3,

                    "url": "https://example.com/video.mp4",
                    "caption": "This is a video.",
                    'created_at': '2020-03-03',
                  },
                ],
              }),
            ),
            200,
          );
        } else {
          return http.Response(jsonEncode([]), 404);
        }
      });

      photoRepository = PhotoRepositoryImpl(
        PhotoDataSourceImpl(dto, client: client),
        dto,
      );
    });
    test(' 전체 조회 ', () async {
      List<Photo> photos = await photoRepository.getItems();

      expect(photos.length, 6);
    });
  });
}
