import 'dart:typed_data';

import 'package:modu_3_dart_study/2025-04-02/data_source/image_data_source.dart';
import 'package:modu_3_dart_study/2025-04-02/repository/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  ImageDataSource imageDataSource;

  ImageRepositoryImpl({required this.imageDataSource});

  @override
  Future<void> saveImage(String url, String path) async {
    Uint8List image = await imageDataSource.fetchImage(url);
    await imageDataSource.saveImage(image, path);
  }

  @override
  Future<void> saveImages(List<String> urls, String directory) async {
    for (int i = 0; i < urls.length; i++) {
      Uint8List image = await imageDataSource.fetchImage(urls[i]);
      await imageDataSource.saveImage(image, directory + 'happy_image_${i + 1}.jpg');
    }
  }
}
