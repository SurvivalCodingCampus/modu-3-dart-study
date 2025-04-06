import 'package:modu_3_dart_study/2025-04-04/model/photo.dart';

abstract class PhotoRepository {
  Future<List<Photo>> getPhotos();
}