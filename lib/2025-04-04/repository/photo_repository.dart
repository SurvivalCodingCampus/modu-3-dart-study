// lib/2025-04-04/repository/photo_repository.dart
import '../model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> fetchPhotos();
}
