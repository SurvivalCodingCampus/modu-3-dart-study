import 'package:test/test.dart';

import '../../../assignments/2025_04_01/solution2/data_source/photo_data_source.dart';
import '../../../assignments/2025_04_01/solution2/data_source/photo_data_source_impl.dart';
import '../../../assignments/2025_04_01/solution2/mock/mock_photo_data_source.dart';
import '../../../assignments/2025_04_01/solution2/repository/photo_repository.dart';
import '../../../assignments/2025_04_01/solution2/repository/photo_repository_impl.dart';

void main() {
  group('Data Source', () {
    final PhotoDataSource photoDataSource = PhotoDataSourceImpl();

    test('Data Source 제대로 잘 가져오는지 확인', () async {
      final result = await photoDataSource.getPhotos();

      expect(result.length, 5000);
    });
  });

  group('Repository', () {
    final PhotoRepository photoRepository = PhotoRepositoryImpl(
      PhotoDataSourceImpl(),
    );

    test('AlbumId 의 List', () async {
      final albumId = 20;
      final results = await photoRepository.getPhotos(albumId);

      expect(results.map((e) => e.albumId).first, albumId);
      expect(results.map((e) => e.albumId).last, albumId);

      print(results);
    });
  });

  group('Mock Data', () {
    final PhotoDataSource mockPhotoDataSource = MockPhotoDataSource();
    test('Mock length test', () async {
      final result = await mockPhotoDataSource.getPhotos();

      expect(result.length, 3);
    });
  });
}
