import 'package:test/test.dart';

import '../../assignments/2025-04-01/photo/data_source/impl/photo_data_source_impl.dart';
import '../../assignments/2025-04-01/photo/model/photo.dart';
import '../../assignments/2025-04-01/photo/repository/impl/photo_repository_impl.dart';
import '../../assignments/2025-04-01/photo/repository/photo_repository.dart';

void main() {
  final PhotoRepository photoRepository = PhotoRepositoryImpl(
    PhotoDataSourceImpl(),
    Photo(),
  );

  group('사진 : ', () {
    test('albumId 로 구분된 댓글 목록 가져오기', () async {
      print(await photoRepository.getItemsByKey(90, 'photos.json'));
    });
  });
}
