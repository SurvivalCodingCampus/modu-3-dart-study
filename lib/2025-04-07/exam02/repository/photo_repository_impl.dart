import 'package:modu_3_dart_study/2025-04-07/exam02/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/exam02/dto/pixabay_dto.dart';
import 'package:modu_3_dart_study/2025-04-07/exam02/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/2025-04-07/exam02/repository/photo_repository.dart';

import '../core/result.dart';
import '../model/photo.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  const PhotoRepositoryImpl({required PhotoDataSource photoDataSource})
    : _photoDataSource = photoDataSource;

  @override
  Future<Result<List<Photo>, String>> getPhotos({String? query}) async {
    if (query == '바보') return Result.error('비속어를 사용할 수 없습니다');

    try {
      final PixabayDto pixabayData = await _photoDataSource.getPixabayData();
      final List<Hits> imageDataList = pixabayData.hits ?? [];
      final List<Photo> photoList =
          imageDataList.map((e) => e.toPhoto()).toList();

      return Result.success(photoList);
    } catch (e) {
      print('알 수 없는 네트워크 에러');
      return Result.error('알 수 없는 네트워크 에러');
    }
  }
}
