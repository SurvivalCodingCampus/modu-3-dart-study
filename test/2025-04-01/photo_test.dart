import 'package:test/test.dart';

import '../../assignments/2025-04-01/data_source/photo_data_source.dart';
import '../../assignments/2025-04-01/data_source/photo_data_source_impl.dart';
import '../../assignments/2025-04-01/model/photo.dart';
import '../../assignments/2025-04-01/repository/photo_repository.dart';
import '../../assignments/2025-04-01/repository/photo_repository_impl.dart';

void main() {
  group('Photo 테스트', () {
    test('mock데이터 테스트', () async {
      String path = 'assignments/2025-04-01/data_source/mock_photos.json';
      PhotoDataSource photoDataSource = PhotoDataSourceImpl(path: path);
      PhotoRepository photoRepository = PhotoRepositoryImpl(
        dataSource: photoDataSource,
      );
      List<Photo> photos = await photoRepository.getPhotos(123);
      expect(photos[0].albumId, 123);
      expect(photos[0].id, 456);
      expect(photos[0].title, 'test title');
      expect(photos[0].url, 'test url');
      expect(photos[0].thumbnailUrl, 'test thumbnailUrl');
    });
    test('본데이터 test', () async {
      String path = 'assignments/2025-04-01/data_source/photos.json';
      PhotoDataSource photoDataSourceImpl = PhotoDataSourceImpl(path: path);
      PhotoRepository photoRepositoryImpl = PhotoRepositoryImpl(
        dataSource: photoDataSourceImpl,
      );

      List<Map<String, dynamic>> allPhotos =
          await photoDataSourceImpl.getAllPhotos();
      expect(
        allPhotos.sublist(0, 1).toString(),
        '''[{albumId: 1, id: 1, title: accusamus beatae ad facilis cum similique qui sunt, url: https://via.placeholder.com/600/92c952, thumbnailUrl: https://via.placeholder.com/150/92c952}]''',
      );
      List<Photo> photos = await photoRepositoryImpl.getPhotos(1);

      expect(
        photos[0].title,
        'accusamus beatae ad facilis cum similique qui sunt',
      );
    });
  });
}
