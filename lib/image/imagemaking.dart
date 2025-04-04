import 'dart:io';

import '../data_source/25-04-03/image_data_source/image_data_source_impl.dart';
import '../repository/25-04-03/image_repository/image_repository_impl.dart';

void main() async {
  final dataSource = ImageDataSourceImpl();
  final repository = ImageRepositoryImpl(dataSource: dataSource);

  String imageUrl =
      'https://cdn.eyesmag.com/content/uploads/sliderImages/2024/11/08/1-66d6d810-6b71-445a-bd99-0e09628cb691.jpg';
  String savePath = '${Directory.current.path}/lib/image_test/sample.jpg';

  List<String> imageUrls = [
    'https://blog.kakaocdn.net/dn/cI8BDq/btsyktPgoR2/Z0cmFl8uJtRMs8uBTUae2k/img.jpg',
    'https://mblogthumb-phinf.pstatic.net/MjAyMzA1MjlfNjkg/MDAxNjg1MzIyNzk0MTI4.Jxaqsrfd4a7slLJhSyvN2SM-K6Y3cvbKTsiMfb8jOtcg.NYDknxrOattxTwYt13QE-K9tl3UsHxTs5g2b1Zy_EYcg.JPEG.gooddaykiki/IMG_9905.JPG?type=w800',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSis7UdKlzWNdH5QUJ43-NkH8roay8FjuGyqw&s',
    'https://pbs.twimg.com/media/GkPWs-zXYAAyMsU?format=jpg&name=medium',
  ];
  await repository.saveImage(imageUrl, savePath);
  await repository.saveImages(imageUrls, savePath);
}
