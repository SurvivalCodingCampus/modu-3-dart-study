import 'package:modu_3_dart_study/apr/w1/2025-04-04/photo/data_source/mock_photo_data_source_impl.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-04/photo/enum/type_enum.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-04/photo/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  final _photoDataSource = MockPhotoDataSourceImpl();
  final repository = PhotoRepositoryImpl(photoDataSource: _photoDataSource);

  test('photo', () async {
    final photos = await repository.getPhotos();

    expect(photos[3].id, equals(1));
    expect(photos.length, equals(6));
    expect(photos[4].type, equals(PhotoType.Unknown));
    expect(photos[0].createdAt, equals(DateTime(2020, 01, 01)));
    expect(photos[5].type, equals(PhotoType.Unknown));
  });
}
