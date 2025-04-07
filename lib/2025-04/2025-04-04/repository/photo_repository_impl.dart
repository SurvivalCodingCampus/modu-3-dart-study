import 'package:modu_3_dart_study/2025-04/2025-04-04/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/dto/photo_dto.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/model/photo.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  const PhotoRepositoryImpl(this._dataSource);

  @override
  Future<List<Photo>> findAll() async {
    final List<PhotoDto> photos = await _dataSource.fetch();
    return photos.map((e) => e.toModel()).toList();
  }

  @override
  Future<Photo?> findOne(FindOneFilter predicate) async {
    final List<Photo> photos = await findAll();
    return photos.where(predicate).firstOrNull;
  }
}
