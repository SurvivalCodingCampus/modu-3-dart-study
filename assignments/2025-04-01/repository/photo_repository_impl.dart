import 'dart:io';

import '../data_source/data_source.dart';
import '../data_source/date_source_impl.dart';
import '../data_source/mock/mock_photo_data_source_impl.dart';
import '../model/photo.dart';
import 'photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final DataSource _photoDataSource;
  const PhotoRepositoryImpl(this._photoDataSource);

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    try {
      final filePath =
          '${Directory.current.path}/assignments/2025-04-01/photos.json';
      List<dynamic> jsonList = await _photoDataSource.getList(filePath);

      return jsonList
          .map((json) => Photo.fromJson(json))
          .where((e) => e.albumId == albumId)
          .toList();
    } catch (e) {
      print('예상치 못한 오류 발생: $e');
      return [];
    }
  }
}

void main() async {
  final mockPhotoDataSource = MockPhotoDataSourceImpl();
  final dataSource = DataSourceImpl();
  final photoRepository = PhotoRepositoryImpl(mockPhotoDataSource);

  List<Photo> photos = await photoRepository.getPhotos(1);

  print(photos);
}
