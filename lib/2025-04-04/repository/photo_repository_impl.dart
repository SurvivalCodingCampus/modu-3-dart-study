// lib/2025-04-04/repository/photo_repository_impl.dart
import '../data_source/photo_data_source.dart';
import '../dto/photo_dto.dart';
import '../mapper/photo_mapper.dart';
import '../model/photo.dart';
import 'photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl(PhotoDataSource dataSource) : _dataSource = dataSource;

  @override
  Future<List<Photo>> fetchPhotos() async {
    final List<PhotoDto> photoDtos = await _dataSource.getPhotos();
    return photoDtos.map((dto) => dto.toPhoto()).toList();
  }
}
