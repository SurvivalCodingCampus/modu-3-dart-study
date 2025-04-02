import 'package:modu_3_dart_study/PR2025-04-01/photos/data_source/photo_data_source_impl.dart';
import 'package:modu_3_dart_study/PR2025-04-01/photos/model/photo.dart';
import 'package:modu_3_dart_study/PR2025-04-01/photos/repository/photo_repository.dart';
import 'package:modu_3_dart_study/PR2025-04-01/photos/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  test('albumId가 50인 내용만 출력', () async {
    const int postId = 50;
    final PhotoRepository repository = PhotoRepositoryImpl(
      photoDataSource: PhotoDataSourceImpl(),
    );

    List<Photo> photos = await repository.getPhotosByAlbumId(postId);
    //albumId가 50인 객체의 갯수 확인
    expect(photos.length, 50);
    //필터링된 객체의 albumId가 50인지 확인
    for (final photo in photos) {
      expect(photo.albumId, equals(50));
    }
  });
}
