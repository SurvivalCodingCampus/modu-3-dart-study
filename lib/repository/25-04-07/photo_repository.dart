import '../../core/25-04-07/photo_error.dart';
import '../../core/25-04-07/photo_result.dart';
import '../../model/25-04-07/photo.dart';

abstract interface class PhotoRepository {
  Future<Result<List<Photo>>> getResearchImage(String query);
}
