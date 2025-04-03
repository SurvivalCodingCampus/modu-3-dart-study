import 'dart:io';

import 'package:modu_3_dart_study/2025-04-03/image/data_source/image_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/image/repository/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource _dataSource;

  const ImageRepositoryImpl(this._dataSource);

  @override
  Future<void> saveIamge(String url, String path) async {
    await _dataSource.saveImage(await _dataSource.fetchImage(url), path);
  }

  @override
  Future<void> saveImages(List<String> urls, String directory) async {
    await Directory(directory).create();
    for (final url in urls) {
      // 파일 이름 생성 (URL의 마지막 부분을 파일 이름으로 사용)
      final fileName = url.split('/').last;
      final path = '$directory/$fileName';

      // 각 이미지를 개별적으로 저장
      final image = await _dataSource.fetchImage(url);
      await _dataSource.saveImage(image, path);
    }
  }
}
