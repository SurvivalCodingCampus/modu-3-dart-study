import 'package:modu_3_dart_study/2025-04-07/core/error.dart';
import 'package:modu_3_dart_study/2025-04-07/core/result.dart';

import '../model/photo.dart';

abstract interface class PhotoRepository {
  Future<Result<List<Photo>, ImageError>> getPhotos(String query);
}
