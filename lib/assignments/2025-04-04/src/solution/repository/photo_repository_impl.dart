import '../data_source/mock_photo_data_source_impl.dart';
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
    final response = await getPhotos();
    return response.firstWhere((e) => e.id == id);
  }

  @override
  Future<List<Photo>> getPhotos() async {
    final response = await _photoDataSource.getPhotos();
    return response.map((e) => e.toPhoto()).toList();
  }
}

void main() async {
  final repository = PhotoRepositoryImpl(
    photoDataSource: MockPhotoDataSourceImpl(),
  );
  final photos = await repository.getPhotos();
  print(photos);
}
