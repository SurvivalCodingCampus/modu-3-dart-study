import 'package:modu_3_dart_study/2025-04-07/exam02/core/result.dart';
import 'package:modu_3_dart_study/2025-04-07/exam02/data_source/mock_noNetwork_photo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-07/exam02/data_source/mock_photo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-07/exam02/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/exam02/model/photo.dart';
import 'package:modu_3_dart_study/2025-04-07/exam02/repository/photo_repository.dart';
import 'package:modu_3_dart_study/2025-04-07/exam02/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group("", () {
    final PhotoRepository photoNoNetWorkRepository = PhotoRepositoryImpl(
      photoDataSource: MockNonetworkPhotoDataSourceImpl(),
    );

    final PhotoRepository photoRepository = PhotoRepositoryImpl(
      photoDataSource: MockPhotoDataSourceImpl(),
    );

    test("네트워크 오류 테스트", () async {
      final Result<List<Photo>, String> data =
          await photoNoNetWorkRepository.getPhotos();

      expect(data, Result<List<Photo>, String>.error("알 수 없는 네트워크 에러"));
    });

    test("비속어(바보) 테스트", () async {
      final Result<List<Photo>, String> data = await photoNoNetWorkRepository
          .getPhotos(query: '바보');
      expect(data, Result<List<Photo>, String>.error("비속어를 사용할 수 없습니다"));
    });

    test("정상 네트워크 테스트", () async {
      final Result<List<Photo>, String> result =
          await photoRepository.getPhotos();

      print(result);
    });
  });
}
