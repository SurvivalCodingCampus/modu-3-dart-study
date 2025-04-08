import 'package:modu_3_dart_study/2025-04-07/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/dto/photo_dto.dart';
import 'package:modu_3_dart_study/2025-04-07/model/photo.dart';
import 'package:modu_3_dart_study/dto_utils/dto_repository.dart';
import 'package:modu_3_dart_study/enums/photo_error.dart';

import '../../core/result.dart';

abstract class PhotoRepository
    extends DtoRepository<PhotoDto, Photo, PhotoDataSource> {
  PhotoRepository(super.dataSource, super.dto);

  Future<Result<List<Photo>, PhotoError>> getPhotos(String query);
}
