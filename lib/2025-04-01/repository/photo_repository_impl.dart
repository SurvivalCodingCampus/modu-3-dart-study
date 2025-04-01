import 'package:modu_3_dart_study/2025-04-01/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/photo_repository.dart';
import '../model/photo.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource dataSource;

  PhotoRepositoryImpl(this.dataSource);

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    final jsonData = await dataSource.getAllPhotos();
    return jsonData
        .map((e) => Photo.fromJson(e))
        .where((photo) => photo.albumId == albumId)
        .toList();
  }
}