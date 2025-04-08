import 'package:modu_3_dart_study/2025-04-07/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/photo_repository.dart';

import '../core/error.dart';
import '../core/result.dart';
import '../data_source/photo_data_source.dart';
import '../model/photo.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<Photo>, ImageError>> getPhotos(String query) async {
    try {
      if (query.contains('바보')) {
        return const Result.error(ImageError.invalidWord);
      }

      final photoDtos = await _dataSource.getPhotos(query);
      final photos = photoDtos.map((dto) => dto.toPhoto()).toList();

      return Result.success(photos);
    } catch (e) {
      return const Result.error(ImageError.networkError); // 네트워크 에러 처리
    }
  }
}
