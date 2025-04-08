import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/core/modules/error_handling/result.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/core/modules/exception/custom_exception.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/photo/model/photo.dart';

abstract interface class PhotoRepository {
  Future<Result<List<Photo>, CustomException>> getPhotos(List<String> tags);
}