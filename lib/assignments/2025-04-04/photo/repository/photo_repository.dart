import 'package:modu_3_dart_study/assignments/2025-04-04/photo/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos();
}
