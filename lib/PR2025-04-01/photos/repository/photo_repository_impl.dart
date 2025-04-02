import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/PR2025-04-01/photos/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/PR2025-04-01/photos/model/photo.dart';
import 'package:modu_3_dart_study/PR2025-04-01/photos/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  const PhotoRepositoryImpl({required PhotoDataSource photoDataSource})
    : _photoDataSource = photoDataSource;

  @override
  Future<List<Photo>> getPhotosByAlbumId(int albumId) async {
    //모든 photos.json 파일에 있는 내용 불러오기
    List<Photo> allPhotos = await _photoDataSource.getPhotos();
    //조건 추가하기
    List<Photo> selectedPhotos =
        allPhotos.where((e) => e.albumId == albumId).toList();
    return selectedPhotos;
  }
}
