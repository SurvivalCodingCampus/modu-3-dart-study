import 'package:modu_3_dart_study/core/25-04-07/photo_error.dart';
import 'package:modu_3_dart_study/core/25-04-07/photo_result.dart';
import 'package:modu_3_dart_study/mapper/25-04-07/to_photo_model.dart';
import 'package:modu_3_dart_study/model/25-04-07/photo.dart';
import '../../data_source/25-04-07/photo_data_source.dart';
import '../../dto/25-04-07/photo_dto.dart';
import '../25-04-07/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource dataSource;
  PhotoRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<Photo>>> getResearchImage(String query) async {
    try {
      if (query.trim() == '바보') {
        return Result.error('비속어를 사용할 수 없습니다..');
      }
      final dtoList = await dataSource.getImages(query);
      final List<Photo> photos =
          dtoList.map((dto) => dto.toPhotoModel()).toList();
      return Result.success(photos);
    } catch (e) {
      return Result.error('알 수 없는 네트워크 에러');
    }
  }
}
