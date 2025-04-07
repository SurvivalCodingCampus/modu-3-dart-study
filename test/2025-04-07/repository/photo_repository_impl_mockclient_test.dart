import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-04-07/core/result.dart';
import 'package:modu_3_dart_study/2025-04-07/data_source/http_photo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('PhotoRepositoryImpl (Real API)', () {
    test('실제 Pixabay API 호출하여 사진을 가져온다', () async {
      final dataSource = HttpPhotoDataSource(); // 기본 Client 사용
      final repo = PhotoRepositoryImpl(dataSource);

      final result = await repo.getPhotos('아이유');

      switch (result) {
        case Success(:final data):
          print('✅ 성공! 총 ${data.length}개의 이미지');
          for (var photo in data.take(3)) {
            print(' - ${photo.tags} / ${photo.imageUrl}');
          }
        case Error(:final error):
          print('❌ 실패: $error');
          fail('실제 호출인데 실패했음');
      }
      dataSource.dispose();
    });
  });

  group('HttpPhotoDataSource with MockClient', () {
    test('정상적으로 사진을 받아오는 경우', () async {
      final mockClient = MockClient((request) async {
        return http.Response(
          jsonEncode({
            "hits": [
              {"tags": "아이유", "webformatURL": "https://img.com/iu1.jpg"},
              {"tags": "아이유", "webformatURL": "https://img.com/iu2.jpg"},
            ],
          }),
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
        );
      });

      final dataSource = HttpPhotoDataSource(client: mockClient);

      final result = await dataSource.getPhotos("아이유");
      expect(result.length, 2);
      expect(result.first.tags, '아이유');
      expect(result.first.imageUrl, 'https://img.com/iu1.jpg');
    });

    test('API 호출 실패 시 예외 발생', () async {
      final mockClient = MockClient((request) async {
        return http.Response('Internal Server Error', 500);
      });

      final dataSource = HttpPhotoDataSource(client: mockClient);

      expect(() async => await dataSource.getPhotos("에러"), throwsException);
    });
  });
}
