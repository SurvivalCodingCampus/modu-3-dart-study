import 'dart:typed_data';

import 'package:modu_3_dart_study/2025-04-03/data_source/image_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/repository/image_repository.dart';

import '../data_source/image_data_source_impl.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource _imageDataSource;

  const ImageRepositoryImpl({required ImageDataSource imageDataSource})
    : _imageDataSource = imageDataSource;

  @override
  Future<void> saveImage(String url, String path) async {
    final Uint8List imageData = await _imageDataSource.fetchImage(url);
    await _imageDataSource.saveImage(imageData, path);
  }

  @override
  Future<void> saveImages(List<String> urls, String directory) async {
    for (int i = 0; i < urls.length; i++) {
      final Uint8List imageData = await _imageDataSource.fetchImage(urls[i]);
      await _imageDataSource.saveImage(imageData, '$directory/image${i + 1}.png');
    }
  }
}

void main() async {
  const List<String> imageUrls = [
    'https://item.kakaocdn.net/do/364ea504f5f1927e56803b1e6a2e1a669f17e489affba0627eb1eb39695f93dd',
    'https://blog.kakaocdn.net/dn/W8qP0/btszCnnMYJy/4IfsrO1qoUFCVsSr0GeSq0/img.jpg',
  ];
  const String imagePath = 'lib/2025-04-03/single_image.png';
  const String imageDirectory = 'lib/2025-04-03';

  final ImageRepository imageRepository = ImageRepositoryImpl(
    imageDataSource: ImageDataSourceImpl(),
  );

  await imageRepository.saveImage(imageUrls.first, imagePath); // 한장만 저장
  await imageRepository.saveImages(imageUrls, imageDirectory); // 여러장 저장
}
