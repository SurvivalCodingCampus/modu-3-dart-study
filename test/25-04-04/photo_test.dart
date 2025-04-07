import 'package:modu_3_dart_study/data_source/25-04-04/mock_photo_data_source_impl.dart';
import 'package:modu_3_dart_study/repository/25-04-04/photo_repository_impl.dart'
    show PhotoRepositoryImpl;
import 'package:test/expect.dart';

import 'package:test/scaffolding.dart';

void main() async {
  test('getPhotos', () async {
    final dataSource = MockPhotoDataSourceImpl();
    PhotoRepositoryImpl repository = PhotoRepositoryImpl(dataSource);
    final photos = await repository.getPhotoList();
    print(photos);
    expect(photos.length, 6);
    //type enum 확인
    expect(photos[0].type.name, 'article');
    expect(photos[1].type.name, 'image');
    expect(photos[2].type.name, 'video');
    // string int 변환 확인
    expect(photos[3].id, 1);
  });
}
