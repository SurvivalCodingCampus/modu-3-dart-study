
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/photo/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/photo/repository/photo_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/photo/data_source/mock/mock_photo_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/photo/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/photo/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('photo test', (){
    final PhotoDataSource dataSource = MockPhotoDataSourceImpl();
    final PhotoRepository repo = PhotoRepositoryImpl(dataSource);

    test('photo repo test', () async {
      final photos = await repo.fetchPhotos();
      final mockData = await dataSource.fetchPhotos();
      
      photos.forEach((e) => print(e.toJson()));
      expect(photos.length, equals(mockData.length));
      expect(photos, mockData.map((e) => e.toPhoto()).toList());
    });
  });
}