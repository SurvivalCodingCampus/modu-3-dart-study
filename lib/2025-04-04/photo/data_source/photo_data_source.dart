import 'package:modu_3_dart_study/2025-04-04/photo/dto/photo_dto.dart';
import 'package:modu_3_dart_study/dto_utils/dto_data_source.dart';

import '../model/photo.dart';

abstract class PhotoDataSource extends DtoDataSource<PhotoDto, Photo> {
  PhotoDataSource(super.httpUrl, super.dto, {super.client});
}
