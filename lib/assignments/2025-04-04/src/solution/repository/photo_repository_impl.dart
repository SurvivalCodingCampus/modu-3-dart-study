import '../data_source/photo_data_source.dart';
import '../mapper/photo_mapper.dart';
import '../model/photo.dart';
import 'photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl({required PhotoDataSource photoDataSource})
    : _photoDataSource = photoDataSource;

  @override
  Future<Photo> getPhoto(int id) async {
    final response = await _photoDataSource.getPhoto(id);
    return response.toPhoto();
  }

  @override
  Future<List<Photo>> getPhotos() async {
    final response = await _photoDataSource.getPhotos();
    return response.map((e) => e.toPhoto()).toList();
  }
}
