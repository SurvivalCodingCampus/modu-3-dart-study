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
    final result = await getPhotos();
    final Photo photo = result.singleWhere((e) => e.id == id);
    return photo;
  }

  @override
  Future<List<Photo>> getPhotos() async {
    final result = await _photoDataSource.getPhotos();
    final List<Photo> photoList = [];

    for (var photo in result) {
      photoList.add(photo.toPhoto());
    }
    return photoList;
  }
}
