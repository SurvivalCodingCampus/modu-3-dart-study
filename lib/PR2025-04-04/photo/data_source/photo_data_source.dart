import 'package:modu_3_dart_study/PR2025-04-04/photo/dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<List<PhotoDto>> getPhotosData();
}
