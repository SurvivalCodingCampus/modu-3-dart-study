import 'package:modu_3_dart_study/assignments/2025-04-04/src/solution/data_source/mock_photo_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/src/solution/enum/media_type.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/src/solution/model/photo.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/src/solution/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('Photo Repository Test', () {
    final dataSource = MockPhotoDataSourceImpl();
    final repository = PhotoRepositoryImpl(photoDataSource: dataSource);
    int testId = 0;
    test('getPhotos 테스트', () async {
      final photos = await repository.getPhotos();

      expect(photos, isA<List<Photo>>());
      expect(photos.length, 6);
    });

    test('getPhoto 테스트 - type이 article인 데이터', () async {
      testId = 1; // type이 article인 데이터
      final photo = await repository.getPhoto(testId);

      expect(photo.type, equals(MediaType.article));
    });
    test('getPhoto 테스트 - type이 image인 데이터', () async {
      testId = 2; // type이 image 데이터
      final photo = await repository.getPhoto(testId);

      expect(photo.type, equals(MediaType.image));
    });
    test('getPhoto 테스트 - type이 video인 데이터', () async {
      testId = 3; // type이 video 데이터
      final photo = await repository.getPhoto(testId);

      expect(photo.type, equals(MediaType.video));
    });
    test('getPhoto 테스트 - type이 빈 값이 데이터', () async {
      testId = 4; // type이 ''인 데이터
      final photo = await repository.getPhoto(testId);

      expect(photo.type, equals(MediaType.unknown));
    });

    test('getPhoto 테스트 - type이 null인 데이터', () async {
      testId = 5; // type이 null 데이터
      final photo = await repository.getPhoto(testId);

      expect(photo.type, equals(MediaType.unknown));
    });

    test('getPhoto 테스트 - type 키가 없는 데이터', () async {
      testId = 6; // type 키가 없는 데이터
      final photo = await repository.getPhoto(testId);

      expect(photo.type, equals(MediaType.unknown));
    });

    test('getPhoto 테스트 - id가 String인 데이터', () async {
      testId = 4; // id가 String 타입
      final photo = await repository.getPhoto(testId);

      expect(photo.id, isA<int>()); // int로 잘 바뀌었는지 확인
    });

    test('getPhoto 테스트 - createAt', () async {
      testId = 1; // id가 String 타입
      final photo = await repository.getPhoto(testId);

      expect(photo.createdAt, isA<DateTime>()); // int로 잘 바뀌었는지 확인
    });
  });
}
