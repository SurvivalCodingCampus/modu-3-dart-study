import 'dart:io';

import 'package:modu_3_dart_study/repository/25-04-03/image_repository/image_repository.dart';

import '../../../data_source/25-04-03/image_data_source/image_data_source.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource dataSource;
  ImageRepositoryImpl({required this.dataSource});

  @override
  Future<void> saveImage(String url, String path) async {
    final bytes = await dataSource.fetchImage(url);
    await dataSource.saveImage(bytes, path);
  }

  @override
  Future<void> saveImages(List<String> urls, String path) async {
    for (var i = 0; i < urls.length; i++) {
      final filePath = '${Directory.current.path}/lib/image_test/$i.jpg';
      await saveImage(urls[i], filePath);
    }
  }
}
