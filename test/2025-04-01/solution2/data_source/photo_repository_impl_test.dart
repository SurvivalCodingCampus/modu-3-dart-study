import 'package:modu_3_dart_study/2025-04-01/solution2/data_source/mock_photo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/solution2/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/solution2/data_source/photo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/solution2/data_source/photo_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/solution2/data_source/photo_repository_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/solution2/model/photo.dart';
import 'package:test/test.dart';

void main() async {
  test('1.MockData test', () async {
    //데이터 가져오기
    PhotoRepository photoRepository = PhotoRepositoryImpl(
      photoDataSource: MockPhotoDataSourceImpl(),
    );

    List<Photo> photo = await photoRepository.getPhotos(1);

    expect(photo.length, equals(11));
  });

  test('2.RealData test', () async {
    //데이터 가져오기
    PhotoRepository photoRepository = PhotoRepositoryImpl(
      photoDataSource: PhotoDataSourceImpl(
        path: 'lib/2025-04-01/solution2/data_source/photos.json',
      ),
    );

    List<Photo> photo = await photoRepository.getPhotos(1);

    expect(photo.length, equals(50));
  });
}
