import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/data_source/photo_data_source_impl.dart';

import 'package:modu_3_dart_study/assignments/2025-04-04/photo/data_source/remote/photo_remote_data_source_impl.dart';

import 'package:modu_3_dart_study/assignments/2025-04-04/photo/repository/photo_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/repository/photo_repository_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/util/type_enum.dart';
import 'package:test/test.dart';

void main() {
  final String path1 = 'lib/assignments/2025-04-04/photo/data/mock_data1.json';
  final String path2 = 'lib/assignments/2025-04-04/photo/data/mock_data2.json';
  PhotoDataSource photoDataSource1 = PhotoDataSourceImpl(path: path1);
  PhotoDataSource photoDataSource2 = PhotoDataSourceImpl(path: path2);
  PhotoRepository photoRepository1 = PhotoRepositoryImpl(
    dataSource: photoDataSource1,
  );
  PhotoRepository photoRepository2 = PhotoRepositoryImpl(
    dataSource: photoDataSource2,
  );
  test('첫번째 목데이터 테스트', () async {
    final photos = await photoRepository1.getPhotos();
    expect(photos.length, 3);
    expect(photos[0].id, 1);
    expect(photos[0].url, '');
    expect(photos[1].url, 'https://example.com/image.jpg');
    expect(photos[2].url, 'https://example.com/video.mp4');
  });

  test('두번째 목데이터 테스트', () async {
    final photos = await photoRepository2.getPhotos();
    expect(photos.length, 3);
    expect(photos[0].id, 1);
    expect(photos[0].type, PhotoType.Article);
    expect(photos[1].type, PhotoType.Unknown);
    expect(photos[2].id, 3);
    expect(photos[2].type, PhotoType.Unknown);
  });

  test('MockClient 테스트', () async {
    final mockClient = MockClient((request) async {
      final jsonString =
          await File(
            'lib/assignments/2025-04-04/photo/data/mock_data1.json',
          ).readAsString();

      return http.Response(jsonString, 200);
    });
    PhotoDataSource photoRemoteDataSource = PhotoRemoteDataSourceImpl(
      url: 'https://naver.com',
      client: mockClient,
    );
    PhotoRepository photoRepository = PhotoRepositoryImpl(
      dataSource: photoRemoteDataSource,
    );

    final photos = await photoRepository.getPhotos();
    expect(photos.length, 3);
    expect(photos[0].id, 1);
    expect(photos[0].url, '');
    expect(photos[1].url, 'https://example.com/image.jpg');
    expect(photos[2].url, 'https://example.com/video.mp4');
  });
}
