import 'package:modu_3_dart_study/2025-04-04/photo/dto/photo_dto.dart';
import 'package:modu_3_dart_study/2025-04-04/photo/model/photo.dart';
import 'package:modu_3_dart_study/dto_utils/dto_repository.dart';

import '../data_source/photo_data_source.dart';

abstract class PhotoRepository
    extends DtoRepository<PhotoDto, Photo, PhotoDataSource> {
  PhotoRepository(super.dataSource, super.dto);
}
