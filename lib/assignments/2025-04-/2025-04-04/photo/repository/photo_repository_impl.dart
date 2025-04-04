import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/photo/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/photo/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/photo/model/photo.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/photo/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl(this._dataSource);

  @override
  Future<List<Photo>> fetchPhotos() async {
    final resp = await _dataSource.fetchPhotos();
    final photos = resp.map((e) => e.toPhoto()).toList();
    return photos;
  }
}
