import 'package:modu_3_dart_study/2025-04-04/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/dto/photo_dto.dart';
import 'package:modu_3_dart_study/2025-04-04/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/2025-04-04/repository/photo_repository.dart';

import '../model/photo.dart';

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
