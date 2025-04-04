import 'package:modu_3_dart_study/PR2025-04-04/photo/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/PR2025-04-04/photo/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/PR2025-04-04/photo/model/photo.dart';
import 'package:modu_3_dart_study/PR2025-04-04/photo/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  const PhotoRepositoryImpl({required PhotoDataSource photoDataSource})
    : _photoDataSource = photoDataSource;

  @override
  Future<List<Photo>> getPhotos() async {
    final photoList = await _photoDataSource.getPhotoesData();
    List<Photo> photos = photoList.map((e) => e.toPhoto()).toList();
    return photos;
  }
}
