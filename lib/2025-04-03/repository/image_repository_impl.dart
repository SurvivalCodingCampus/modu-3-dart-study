import 'dart:typed_data';

import '../data_source/image_data_source.dart';
import 'image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource _dataSource;

  ImageRepositoryImpl({required ImageDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<void> saveImage(String url, String path) async {
    Uint8List imageBytes = await _dataSource.fetchImage(url);
    await _dataSource.saveImage(imageBytes, path);
  }

  @override
  Future<void> saveImages(List<String> urls, String directory) async {
    for (String url in urls) {
      String filename = Uri.parse(url).pathSegments.last;
      String path = '$directory/$filename';
      await saveImage(url, path);
    }
  }

  @override
  Future<bool> saveImageIfNotExists(String url, String path) async {
    if (await _dataSource.exists(path)) return false;
    await saveImage(url, path);
    return true;
  }
}
