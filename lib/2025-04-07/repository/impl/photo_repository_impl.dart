import 'package:modu_3_dart_study/2025-04-07/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/2025-04-07/model/photo.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/photo_repository.dart';
import 'package:modu_3_dart_study/core/result.dart';
import 'package:modu_3_dart_study/enums/photo_error.dart';

import '../../dto/photo_dto.dart';

class PhotoRepositoryImpl extends PhotoRepository {
  PhotoRepositoryImpl(super.dataSource, super.dto);

  bool _validQuery(String query) {
    return query.contains('바보');
  }

  @override
  Future<Result<List<Photo>, PhotoError>> getPhotos(String query) async {
    if (_validQuery(query)) {
      return Result.error(PhotoError.slangError);
    }
    try {
      final List<PhotoDto> photoDtos = await dataSource.getPhotos(query);
      final List<Photo> photos = photoDtos.map((e) => e.toPhoto()).toList();

      return Result.success(photos);
    } on PhotoError {
      return Result.error(PhotoError.networkError);
    }
  }
}
