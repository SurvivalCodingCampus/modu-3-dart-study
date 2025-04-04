import 'package:modu_3_dart_study/repository/25-04-01/photo_repository/photo_repository.dart';

import '../../../data_source/25-04-01/photo_data_source/photo_data_source.dart';
import '../../../model/25-04-01/photo.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource dataSource;
  PhotoRepositoryImpl({required this.dataSource});
  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    final allPhotos = await dataSource.getPhotos();
    return allPhotos;
  }
}
