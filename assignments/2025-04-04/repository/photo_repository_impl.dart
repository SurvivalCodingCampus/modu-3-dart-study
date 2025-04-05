import '../data_source/photo_data_source.dart';
import '../mapper/photo_mapper.dart';
import '../model/photo.dart';
import 'photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  const PhotoRepositoryImpl({required PhotoDataSource photoDataSource})
    : _photoDataSource = photoDataSource;

  @override
  Future<List<Photo>> getPhotolist() async {
    final photoDtoList = await _photoDataSource.getPhotoDataDto();
    final photoList = photoDtoList.map((e) => e.toPhoto()).toList();
    return photoList;
  }
}
