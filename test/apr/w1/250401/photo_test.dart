import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../../playground/apr/w1/2025-04-01/photo/data_source/mock_photo_data_source_impl.dart';
import '../../../../playground/apr/w1/2025-04-01/photo/repository/photo_repository_impl.dart';

void main() {
  test('photo', () async {
    final repository = await PhotoRepositoryImpl(MockPhotoDataSourceImpl());
    final photoData = await repository.getPhotos(1);

    expect(photoData.length, equals(8));
    expect(photoData[0].albumId, equals(1));
  });
}