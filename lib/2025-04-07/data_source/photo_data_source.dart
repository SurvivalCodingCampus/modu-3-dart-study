import 'package:modu_3_dart_study/2025-04-07/dto/photo_dto.dart';
import 'package:modu_3_dart_study/2025-04-07/model/photo.dart';
import 'package:modu_3_dart_study/dto_utils/dto_data_source.dart';

abstract class PhotoDataSource extends DtoDataSource<PhotoDto, Photo> {
  PhotoDataSource(super.httpUrl, super.dto, {super.client});

  Future<List<PhotoDto>> getPhotos(String query);
}
