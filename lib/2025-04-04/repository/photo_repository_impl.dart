import 'package:modu_3_dart_study/2025-04-04/repository/photo_repository.dart';

import '../data_source/photo_data_source.dart';
import '../model/photo.dart';
import '../dto/photo_dto.dart';
import '../mapper/photo_mapper.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource dataSource;

  PhotoRepositoryImpl({required this.dataSource});

  @override
  Future<List<Photo>> getPhotos() async {
    try {
      final List<PhotoDto> dtoList = await dataSource.fetchPhotos();

      // DTO → Model 변환 + 유효성 필터링
      final List<Photo> validPhotos = dtoList
          .map((dto) => dto.toModel())
          .where((photo) => photo.type != PhotoType.unknown)
          .toList();

      return validPhotos;
    } catch (e) {
      print('Error in repository: $e');
      return [];
    }
  }
}