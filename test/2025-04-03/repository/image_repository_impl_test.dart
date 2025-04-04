import 'package:modu_3_dart_study/2025-04-03/data_source/image_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/data_source/image_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/repository/image_repository.dart';
import 'package:modu_3_dart_study/2025-04-03/repository/image_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  const List<String> imageUrls = [
    'https://item.kakaocdn.net/do/364ea504f5f1927e56803b1e6a2e1a669f17e489affba0627eb1eb39695f93dd',
    'https://blog.kakaocdn.net/dn/W8qP0/btszCnnMYJy/4IfsrO1qoUFCVsSr0GeSq0/img.jpg',
  ];
  const String imagePath = 'lib/2025-04-03/single_image.png';
  const String imageDirectory = 'lib/2025-04-03';

  test('saveImage 이미지 1장 다운로드', () async {
    final ImageRepository imageRepository = ImageRepositoryImpl(
      imageDataSource: ImageDataSourceImpl(),
    );
    expect(
      () async =>
          await imageRepository.saveImage(imageUrls.first, imagePath),
      returnsNormally,
    );
  });

  test('saveImages 이미지 여러장 다운로드', () async {
    final ImageRepository imageRepository = ImageRepositoryImpl(
      imageDataSource: ImageDataSourceImpl(),
    );
    expect(
          () async =>
      await imageRepository.saveImages(imageUrls, imageDirectory),
      returnsNormally,
    );
  });
}
