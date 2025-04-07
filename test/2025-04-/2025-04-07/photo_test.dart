import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/core/modules/error_handling/result.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/core/modules/exception/custom_exception.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/photo/data_source/impl/photo_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/photo/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/photo/model/photo.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/photo/repository/impl/photo_repository_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/photo/repository/photo_repository.dart';
import 'package:test/test.dart';

void photoRespHandler(Result<List<Photo>, CustomException> resp) {
  switch (resp) {
    case Success<List<Photo>, CustomException>():
      print('이미지 불러오기 성공');
      break;
    case Error<List<Photo>, CustomException>():
      switch (resp.error) {
        case ImageValidateError():
          print(resp.error.toString());
          expect(resp, isA<Error<List<Photo>, CustomException>>());
          break;
        case ImageNetworkError():
          print(resp.toString());
          break;
      }
  }
}

void main() {
  group('pixabay api test', () {
    final PhotoDataSource dataSource = PhotoDataSourceImpl();
    final PhotoRepository repo = PhotoRepositoryImpl(dataSource);
    final List<String> tags = ['산', '자연'];
    final List<String> errorTags = ['바보', '자연'];
    test('tags = "바보" error test', () async {
      final resp = await repo.getPhotos(errorTags);
      photoRespHandler(resp);
    });

    test('image api test', () async {
      final resp = await repo.getPhotos(tags);
      photoRespHandler(resp);
    });
  });
}
