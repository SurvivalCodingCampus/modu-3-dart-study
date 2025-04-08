import 'package:modu_3_dart_study/2025-04/2025-04-07/core/photo_error.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/model/photo.dart';
import 'package:modu_3_dart_study/core/result.dart';

abstract interface class PhotoRepository {
  Future<Result<List<Photo>, PhotoError>> getPhotos(String query);
}
