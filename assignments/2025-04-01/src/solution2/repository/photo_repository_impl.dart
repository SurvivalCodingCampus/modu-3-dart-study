import 'package:modu_3_dart_study/2025-04-01/solution2/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/solution2/model/photo.dart';
import 'package:modu_3_dart_study/2025-04-01/solution2/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl(this._photoDataSource);

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    final photos = await _photoDataSource.getPhotos();
    return photos
        .map((e) => Photo.fromJson(e))
        .where((e) => e.albumId == albumId)
        .toList();
  }
}