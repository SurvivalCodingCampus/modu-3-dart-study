import 'package:modu_3_dart_study/2025-04-04/exam/exam_02/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/exam/exam_02/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/2025-04-04/exam/exam_02/model/photo.dart';
import 'package:modu_3_dart_study/2025-04-04/exam/exam_02/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl(this._dataSource);

  @override
  Future<List<Photo>> getPhotos() async {
    final photoDtoList = await _dataSource.getPhotoDtoList();
    final invalidDateTime = DateTime(1970);
    return photoDtoList
        .map((e) => e.toPhoto())
        .where((e) => e.createdAt != invalidDateTime)
        .toList();
  }
}
