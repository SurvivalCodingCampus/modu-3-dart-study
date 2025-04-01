import 'package:test/test.dart';

import '../../assignments/2025-04-01/photo/model/photo.dart';
import '../../assignments/2025-04-01/photo/repository/impl/photo_repository_impl.dart';
import '../../assignments/2025-04-01/photo/repository/photo_repository.dart';
import 'mock/mock_photo_data_source.dart';

void main() {
  late MockPhotoDataSource photoDataSource;
  late PhotoRepository photoRepository;
  late Photo photo;

  group('사진 : ', () {
    setUpAll(() {
      photoDataSource = MockPhotoDataSource();
      photo = Photo();
      photoRepository = PhotoRepositoryImpl(photoDataSource, photo);

      photoDataSource.setMockData('photos.json', [
        {
          "albumId": 1,
          "id": 1,
          "title": "accusamus beatae ad facilis cum similique qui sunt",
          "url": "https://via.placeholder.com/600/92c952",
          "thumbnailUrl": "https://via.placeholder.com/150/92c952",
        },
        {
          "albumId": 1,
          "id": 2,
          "title": "reprehenderit est deserunt velit ipsam",
          "url": "https://via.placeholder.com/600/771796",
          "thumbnailUrl": "https://via.placeholder.com/150/771796",
        },
        {
          "albumId": 2,
          "id": 3,
          "title": "officia porro iure quia iusto qui ipsa ut modi",
          "url": "https://via.placeholder.com/600/24f355",
          "thumbnailUrl": "https://via.placeholder.com/150/24f355",
        },
      ]);
    });
    test('albumId 로 구분된 댓글 목록 가져오기', () async {
      final List<Photo> photos = await photoRepository.getItemsByKey(
        1,
        'photos.json',
      );

      expect(photos.length, 2);
      expect(photos.first.id, 1);
      expect(
        photos.first.title,
        'accusamus beatae ad facilis cum similique qui sunt',
      );
    });
    test('albumId 로 구분된 댓글 목록 가져오기 실패', () async {
      expect(
        () async => await photoRepository.getItemsByKey(1, 'photos2.json'),
        throwsA(isArgumentError),
      );
    });
  });
}
