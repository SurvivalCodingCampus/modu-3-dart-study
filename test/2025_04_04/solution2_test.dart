import 'package:test/test.dart';

import '../../assignments/2025_04_04/solution2/data_source/photo_data_source_impl.dart';
import '../../assignments/2025_04_04/solution2/repository/photo_repository.dart';
import '../../assignments/2025_04_04/solution2/repository/photo_repository_impl.dart';

void main() {
  group('2번 문제', () {
    final photoDataSourceImpl = PhotoDataSourceImpl();
    final PhotoRepository photoRepository = PhotoRepositoryImpl(
      photoDataSource: photoDataSourceImpl,
    );
    test('DateSource 에서 DTO 로 데이터 반환 확인', () async {
      final result = await photoDataSourceImpl.getPhotos();

      print(result);
      expect(result[0].id, '1');
    });
    test('Repository 에서 Model 로 데이터 반환 확인', () async {
      final results = await photoRepository.getPhotos();
      final result = await photoRepository.getPhoto(3);
      print(results);

      expect(results[1].id, 2);
      expect(result.id, 3);
    });
    test('', () {});
    test('', () {});
    test('', () {});
  });
}
