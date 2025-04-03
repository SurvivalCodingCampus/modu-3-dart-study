import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-04-01/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/data_source/photo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/mock/mock_photo.dart';
import 'package:modu_3_dart_study/2025-04-01/model/photo.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/photo_repository_impl.dart';
import 'dart:io';
import 'dart:convert';

// /// Mock 데이터 소스 구현
// class MockPhotoDataSource implements PhotoDataSource {
//   @override
//   Future<List<Map<String, dynamic>>> fetchPhotos(int albumId) async {
//     final allPhotos = jsonDecode(mockPhotoJson) as List<dynamic>;
//     return allPhotos
//         .map((e) => Map<String, dynamic>.from(e))
//         .where((photo) => photo['albumId'] == albumId)
//         .toList();
//   }
// }

// void main() {
//   late PhotoRepositoryImpl repository;
//   late MockPhotoDataSource mockDataSource;

//   setUp(() {
//     mockDataSource = MockPhotoDataSource();
//     repository = PhotoRepositoryImpl(mockDataSource);
//   });

//   test('albumId 1의 사진을 올바르게 가져와야 함', () async {
//     final photos = await repository.getPhotos(1);

//     expect(photos, isA<List<Photo>>()); // List<Photo> 타입 확인
//     expect(photos.length, equals(2)); // albumId 1에 해당하는 사진 개수
//     expect(photos.first.title, equals("Sunset over the mountains")); // 첫 번째 사진의 제목 확인
//   });

//   test('albumId 2의 사진을 올바르게 가져와야 함', () async {
//     final photos = await repository.getPhotos(2);

//     expect(photos, isA<List<Photo>>());
//     expect(photos.length, equals(2));
//     expect(photos.first.title, equals("City skyline"));
//   });

//   test('존재하지 않는 albumId (99)에 대한 사진 요청 시 빈 리스트 반환', () async {
//     final photos = await repository.getPhotos(99);

//     expect(photos, isEmpty);
//   });
// }

void main() {
  late PhotoRepositoryImpl repository;
  late PhotoDataSourceImpl dataSource;

  setUp(() {
    const filePath = '/Users/roychoi/Documents/GitHub/flutter-study/assignments/2025-04-01/data/photos.json';
    dataSource = PhotoDataSourceImpl(filePath: filePath);
    repository = PhotoRepositoryImpl(dataSource);
  });

  test('albumId 1의 사진을 올바르게 가져와야 함', () async {
    final photos = await repository.getPhotos(1);

    expect(photos, isA<List<Photo>>()); // List<Photo> 타입 확인
    expect(photos.isNotEmpty, isTrue); // 데이터가 비어있지 않아야 함
    print(photos); // 테스트 실행 시 출력 확인
  });

  test('albumId 99의 사진 요청 시 빈 리스트 반환', () async {
    final photos = await repository.getPhotos(101);

    expect(photos, isEmpty);
  });

  test('photos.json 파일이 올바르게 로드되는지 확인', () async {
    final file = File('/Users/roychoi/Documents/GitHub/flutter-study/assignments/2025-04-01/data/photos.json');
    final content = await file.readAsString();

    expect(content.isNotEmpty, isTrue); // 파일이 존재하고 내용이 있어야 함
  });
}