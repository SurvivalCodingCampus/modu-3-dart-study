import 'package:modu_3_dart_study/2025-04-03/solution2/dto/photo_dto.dart';
import 'package:modu_3_dart_study/2025-04-03/solution2/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/2025-04-03/solution2/repository/photo_repository.dart';
import 'package:modu_3_dart_study/2025-04-03/solution2/data_sourece/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/solution2/model/photo.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource photoDataSource;

  PhotoRepositoryImpl(this.photoDataSource);

  @override
  Future<List<Photo>> getAllPhotos() async {
    final jsonList = await photoDataSource.readAllPhotos();
    return jsonList.map((json) => PhotoDto.fromJson(json).toPhoto()).toList();
  }
}