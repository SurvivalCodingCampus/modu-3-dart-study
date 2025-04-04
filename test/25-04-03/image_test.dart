import 'dart:io';

import 'package:modu_3_dart_study/data_source/25-04-03/image_data_source/image_data_source_impl.dart';
import 'package:modu_3_dart_study/repository/25-04-03/image_repository/image_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() async {
  late ImageRepositoryImpl repository;
  late ImageDataSourceImpl dataSource;
  setUp(() {
    dataSource = ImageDataSourceImpl();
    repository = ImageRepositoryImpl(dataSource: dataSource);
  });
  test('한개의 이미지 저장', () async {
    final imageUrl =
        'https://cdn.eyesmag.com/content/uploads/sliderImages/2024/11/08/1-66d6d810-6b71-445a-bd99-0e09628cb691.jpg';
    String savePath = '${Directory.current.path}/lib/image/sample.jpg';
    await repository.saveImage(imageUrl, savePath);
    final file = File(savePath);
    expect(file.existsSync(), true);
  });
  test('여러개의 이미지 저장', () async {
    List<String> imageUrls = [
      'https://blog.kakaocdn.net/dn/cI8BDq/btsyktPgoR2/Z0cmFl8uJtRMs8uBTUae2k/img.jpg',
      'https://mblogthumb-phinf.pstatic.net/MjAyMzA1MjlfNjkg/MDAxNjg1MzIyNzk0MTI4.Jxaqsrfd4a7slLJhSyvN2SM-K6Y3cvbKTsiMfb8jOtcg.NYDknxrOattxTwYt13QE-K9tl3UsHxTs5g2b1Zy_EYcg.JPEG.gooddaykiki/IMG_9905.JPG?type=w800',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSis7UdKlzWNdH5QUJ43-NkH8roay8FjuGyqw&s',
      'https://pbs.twimg.com/media/GkPWs-zXYAAyMsU?format=jpg&name=medium',
    ];
    String savePath = '${Directory.current.path}/lib/image';
    await repository.saveImages(imageUrls, savePath);
    for (var i = 0; i < 4; i++) {
      final file = File('$savePath/$i.jpg');
      expect(file.existsSync(), true);
    }
  });
  tearDown(() {
    final savePath = '${Directory.current.path}/lib/image';
    for (var i = 0; i < 4; i++) {
      final file = File('$savePath/$i.jpg');
      if (file.existsSync()) {
        file.deleteSync();
      }
      final file2 = File('$savePath/sample.jpg');
      if (file2.existsSync()) {
        file2.deleteSync();
      }
    }
  });
}
