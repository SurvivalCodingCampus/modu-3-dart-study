import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-03/exam/exam_02/data_source/image_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/exam/exam_02/repository/image_repository.dart';

import '../data_source/image_data_source_impl.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource _dataSource;

  const ImageRepositoryImpl({required ImageDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<void> saveImage(String url, String path) async {
    final bytes = await _dataSource.fetchImage(url);
    await _dataSource.saveImage(bytes, path);
  }

  @override
  Future<void> saveImages(List<String> urls, String directory) async {
    Directory(directory).createSync(recursive: true);

    urls.forEach((url) async {
      final path = '${DateTime.now().toString()}.jpg';
      await saveImage(url, '$directory/$path');
    });
  }
}

void main() async {
  final repository = ImageRepositoryImpl(
    dataSource: ImageDataSourceImpl(client: http.Client()),
  );
  // await repository.saveImage('https://i.namu.wiki/i/Iau7o1QI8QeV7yJAwkic4FxdSNucaccA4-QC_5Wv_3xAsPK5nN5tHBoR0vSWJ7iE5DcisBeBisqDv4F_JL6sCA.webp', 'image.jpg');

  await repository.saveImages([
    'https://i.namu.wiki/i/Iau7o1QI8QeV7yJAwkic4FxdSNucaccA4-QC_5Wv_3xAsPK5nN5tHBoR0vSWJ7iE5DcisBeBisqDv4F_JL6sCA.webp',
    'https://file2.nocutnews.co.kr/newsroom/image/2025/04/03/202504030905330667_0.jpg',
    'https://img.sbs.co.kr/newsnet/etv/upload/2022/09/19/30000790950.jpg',
  ], 'images');
}
