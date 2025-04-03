import 'dart:io';
import 'dart:typed_data';

import '../data_source/image_data_source.dart';
import 'image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource _imageDataSource;

  ImageRepositoryImpl(this._imageDataSource);

  @override
  Future<void> saveImage(String url, String path) async {
    final imageFile = await _imageDataSource.fetchImage(url);
    await _imageDataSource.saveImage(imageFile, path);
  }

  @override
  Future<void> saveImages(List<String> urls, String directory) async {
    Directory(directory).create();

    for (int i = 0; i < urls.length; i++) {
      String fileName = 'cat$i.jpg';
      String filePath = '$directory/$fileName';

      Uint8List catImage = await _imageDataSource.fetchImage(urls[i]);
      await _imageDataSource.saveImage(catImage, filePath);
    }
  }
}
