import 'package:modu_3_dart_study/data_source/photo_data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/model/Photo.dart';
import 'package:modu_3_dart_study/repository/photo_repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource dataSource;
  PhotoRepositoryImpl({required this.dataSource});
  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    final allPhotos = await dataSource.getPhotos();
    return allPhotos;
  }
}
