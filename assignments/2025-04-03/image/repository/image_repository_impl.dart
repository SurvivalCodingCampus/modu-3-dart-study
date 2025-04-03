import 'dart:typed_data';

import '../data_source/image_data_source.dart';
import 'image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource _dataSource;

  ImageRepositoryImpl({required ImageDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<void> saveImage(String url, String path) async {
    final Uint8List jsonList = await _dataSource.fetchImage(url);
    await _dataSource.saveImage(jsonList, path);
  }

  @override
  Future<void> saveImages(List<String> urls, String directory) async {
    for (int i = 0; i < urls.length; i++) {
      saveImage(urls[i], '$directory/image$i.png');
    }
  }
}
