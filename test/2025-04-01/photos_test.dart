import 'package:test/test.dart';

import 'package:modu_3_dart_study/assignments/2025-04-01/data_source/mock/mock_comment_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-01/data_source/mock/mock_photo_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-01/model/comment.dart';
import 'package:modu_3_dart_study/assignments/2025-04-01/model/photo.dart';
import 'package:modu_3_dart_study/assignments/2025-04-01/repository/comment_repository_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-01/repository/photo_repository_impl.dart';

void main() {
  final mockPhotoDataSource = MockPhotoDataSourceImpl();
  group('예제2) photos', () {
    test('mock 테스트', () async {
      final photoRepository = PhotoRepositoryImpl(mockPhotoDataSource);
      List<Photo> photos = await photoRepository.getPhotos(1);

      expect(photos.length, 2);

      expect(photos[0].albumId, 1);
      expect(photos[0].id, 1);
      expect(
        photos[0].title,
        'accusamus beatae ad facilis cum similique qui sunt',
      );
      expect(photos[0].url, 'https://via.placeholder.com/600/92c952');
      expect(photos[0].thumbnailUrl, 'https://via.placeholder.com/150/92c952');

      expect(photos[1].albumId, 1);
      expect(photos[1].id, 2);
      expect(photos[1].title, 'reprehenderit est deserunt velit ipsam');
      expect(photos[1].url, 'https://via.placeholder.com/600/771796');
      expect(photos[1].thumbnailUrl, 'https://via.placeholder.com/150/771796');
    });
  });
}
