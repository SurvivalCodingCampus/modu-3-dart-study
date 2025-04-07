import 'dart:io';

import 'package:modu_3_dart_study/2025-04-03/data_source/image_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/repositroy/image_repository_impl.dart';

void main() async {
  final dataSource = ImageDataSourceImpl();
  final repository = ImageRepositoryImpl(dataSource);

  String url =
      'https://blog.kakaocdn.net/dn/byZGQl/btrFP1sjYO0/qGonSelLgXyUZavyi9WQsk/img.png';
  final path = 'lib/2025-04-03/data/images/image.png';

  final urls = [
    'https://www.chosun.com/resizer/v2/J6E4HM4HDFKUI3DIBCWSQQUZDM.jpg?auth=9d5c3dff57f30e7eb8a0c109ad30a5887137c5b2a4dac932213e37e5b3885e09&width=616',
    'https://img.khan.co.kr/news/2024/12/19/news-p.v1.20241219.abc3631a81a64e6484614ae60886c5f1.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Steve_Jobs_Headshot_2010-CROP_%28cropped_2%29.jpg/1200px-Steve_Jobs_Headshot_2010-CROP_%28cropped_2%29.jpg',
  ];

  final directory = 'lib/2025-04-03/data/images';

  Directory dir = Directory(directory);
  if (!await dir.exists()) {
    await dir.create(recursive: true);
  }

  try {
    await repository.saveImage(url, path);
    print('이미지 저장 완료! ➜ $path');
  } catch (e) {
    print('이미지 저장 실페: $e');
  }

  try {
    await repository.saveImages(urls, directory);
    print('이미지 여러장 저장 완료! ➜ $directory');
  } catch (e) {
    print('이미지 여러장 저장 실패: $e');
  }
}
