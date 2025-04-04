import 'package:modu_3_dart_study/assignments/2025-04-04/photo/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/dto/photo_dto.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/model/photo.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl({required PhotoDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Photo>> getPhotos() async {
    final List<Map<String, dynamic>> jsonList =
        await _dataSource.getPhotoList();
    final List<PhotoDto> dtoList =
        jsonList.map((e) => PhotoDto.fromJson(e)).toList();
    final List<Photo> photoList = dtoList.map((e) => e.toPhoto()).toList();
    return photoList;
  }
}
