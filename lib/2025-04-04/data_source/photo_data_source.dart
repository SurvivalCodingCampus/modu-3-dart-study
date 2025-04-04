// lib/2025-04-04/data_source/photo_data_source.dart
import 'package:modu_3_dart_study/2025-04-04/dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<List<PhotoDto>> getPhotos();
}
