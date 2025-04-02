import 'package:modu_3_dart_study/2025-04-01/solution1/data_source/comment_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/solution1/data_source/comment_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/solution1/model/comment.dart';
import 'package:modu_3_dart_study/2025-04-01/solution1/repository/comment_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/solution1/repository/comment_repository_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/solution2/data_source/photo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/solution2/repository/photo_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/solution2/repository/photo_repository_impl.dart';
import 'package:modu_3_dart_study/modu_3_dart_study.dart';
import 'package:test/test.dart';

import '../mock/mock_photo_data_source_impl.dart';

void main() {
  test('albumId가 1인 Photo 찾기', () async {
    final PhotoRepository photoRepository = PhotoRepositoryImpl(PhotoDataSourceImpl());
    final photoList = await photoRepository.getPhotos(1);

    expect(photoList.any((e) => e.albumId != 1), isFalse);
  });
  test('Mock 데이터로 albumId가 1인 Photo 찾기', () async {
    final PhotoRepository photoRepository = PhotoRepositoryImpl(MockPhotoDataSourceImpl());
    final photoList = await photoRepository.getPhotos(1);

    expect(photoList.any((e) => e.albumId != 1), isFalse);
  });
}
