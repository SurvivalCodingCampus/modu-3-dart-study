import 'dart:io';

import 'package:modu_3_dart_study/PR2025-04-03/image/data_source/image_data_source.dart';
import 'package:modu_3_dart_study/PR2025-04-03/image/repository/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource _dataSource;

  const ImageRepositoryImpl(this._dataSource);

  @override
  Future<void> saveImage(String url, String path) async {
    await _dataSource.saveImage(await _dataSource.fetchImage(url), path);
  }

  @override
  Future<void> saveImages(List<String> urls, String directory) async {
    for (String url in urls) {
      String filename = Uri.parse(url).pathSegments.last;
      String path = '$directory/$filename';
      await saveImage(url, path);
    }
  }
}
