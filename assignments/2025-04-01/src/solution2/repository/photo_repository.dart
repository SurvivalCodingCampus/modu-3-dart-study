import 'package:modu_3_dart_study/2025-04-01/solution2/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos(int albumId);
}