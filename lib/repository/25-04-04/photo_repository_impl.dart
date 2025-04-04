import 'package:modu_3_dart_study/mapper/25-04-04/to_photo_model.dart';
import 'package:modu_3_dart_study/repository/25-04-04/photo_repository.dart';
import '../../data_source/25-04-04/photo_data_source.dart';
import '../../model/25-04-04/photo.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;
  PhotoRepositoryImpl(this._dataSource);

  @override
  Future<List<Photo>> getPhotoList() async {
    final photoDtos = await _dataSource.getPhotos();
    return photoDtos.map((e) => e.toPhotoModel()).toList();
  }
}
