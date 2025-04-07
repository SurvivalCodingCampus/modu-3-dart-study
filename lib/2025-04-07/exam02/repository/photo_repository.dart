import 'package:modu_3_dart_study/2025-04-07/exam02/core/result.dart';
import 'package:modu_3_dart_study/2025-04-07/exam02/model/photo.dart';

abstract interface class PhotoRepository {
  Future<Result<List<Photo>, String>> getPhotos({String? query});
}
