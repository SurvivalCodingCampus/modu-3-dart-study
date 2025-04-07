import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/core/photo_result.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/model/photo.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/repository/photo_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/util/photo_error_enum.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl({required PhotoDataSource dataSource})
    : _dataSource = dataSource;
  @override
  Future<PhotoResult<List<Photo>, PhotoError>> getPhotos(String query) async {
    if (query == '바보') {
      return PhotoResult.error(PhotoError.badWord);
    }
    try {
      final photoDtos = await _dataSource.getPhotos(query);
      return PhotoResult.success(photoDtos.map((e) => e.toPhoto()).toList());
    } catch (e) {
      return PhotoResult.error(PhotoError.networkError);
    }
  }
}
