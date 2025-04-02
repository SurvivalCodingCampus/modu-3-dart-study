import 'package:modu_3_dart_study/PR2025-04-01/photos/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotosByAlbumId(int albumId);
}
