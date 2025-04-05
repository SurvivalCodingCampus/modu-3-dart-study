import 'package:modu_3_dart_study/2025-04-04/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/2025-04-04/repository/photo_repository.dart';

import '../model/photo.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl({required PhotoDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Photo>> getPhotos() async {
    final photoDto = await _dataSource.fetchPhotos();
    return photoDto.map((e) => e.toPhoto()).toList();
  }
}
