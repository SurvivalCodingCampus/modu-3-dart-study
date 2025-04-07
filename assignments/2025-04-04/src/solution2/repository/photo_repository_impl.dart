import '../data_source/photo_data_source.dart';
import '../dto/photo_dto.dart';
import '../mapper/photo_mapper.dart';
import '../model/photo.dart';
import 'photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  const PhotoRepositoryImpl({required PhotoDataSource photoDataSource})
    : _photoDataSource = photoDataSource;

  @override
  Future<List<Photo>> getPhotos() async {
    try {
      final List<PhotoDto> photoDtos = await _photoDataSource.getPhotos();
      return photoDtos.map((e) => e.toPhoto()).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
