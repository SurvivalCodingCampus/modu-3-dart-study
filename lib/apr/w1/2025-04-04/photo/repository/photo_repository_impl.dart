import 'package:modu_3_dart_study/apr/w1/2025-04-04/photo/data_source/mock_photo_data_source_impl.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-04/photo/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-04/photo/model/photo.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-04/photo/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final MockPhotoDataSourceImpl _photoDataSource;

  const PhotoRepositoryImpl({required MockPhotoDataSourceImpl photoDataSource})
    : _photoDataSource = photoDataSource;

  @override
  Future<List<Photo>> getPhotos() async {
    final photoDtoList = await _photoDataSource.getPhotos();

    final photoList = photoDtoList.map((e) => e.toPhoto()).toList();

    return photoList;
  }
}
