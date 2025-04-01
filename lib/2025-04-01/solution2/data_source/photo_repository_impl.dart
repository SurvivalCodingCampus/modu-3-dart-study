import 'package:modu_3_dart_study/2025-04-01/solution2/data_source/mock_photo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/solution2/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/solution2/data_source/photo_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/solution2/model/photo.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    final List<dynamic> fetchData = await _photoDataSource.fetchPhotos();

    List<Photo> photoList = [];

    if (fetchData.isNotEmpty) {
      fetchData.map((e) {
        if (e["albumId"] == albumId) {
          photoList.add(Photo.fromMap(e));
        }
      }).toList();
    }

    return photoList;
  }

  PhotoRepositoryImpl({required PhotoDataSource photoDataSource})
    : _photoDataSource = photoDataSource;
}
