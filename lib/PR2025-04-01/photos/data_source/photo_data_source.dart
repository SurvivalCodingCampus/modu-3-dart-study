import 'package:modu_3_dart_study/PR2025-04-01/photos/model/photo.dart';

abstract interface class PhotoDataSource {
  Future<List<Photo>> getPhotos();
}
