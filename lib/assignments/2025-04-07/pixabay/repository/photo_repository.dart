import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/core/photo_result.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/model/photo.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/util/photo_error_enum.dart';


abstract interface class PhotoRepository {
  Future<PhotoResult<List<Photo>, PhotoError>> getPhotos(String query);
}
