import 'dart:io';
import 'dart:typed_data';

import 'package:modu_3_dart_study/2025-04-03/exam/exam_02/data_source/image_data_source.dart';
import 'package:http/http.dart' as http;

class ImageDataSourceImpl implements ImageDataSource {
  final http.Client _client;

  const ImageDataSourceImpl({required http.Client client}) : _client = client;

  @override
  Future<Uint8List> fetchImage(String url) async {
    final response = await _client.get(Uri.parse(url));
    return response.bodyBytes;
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) async {
    final file = File(path);
    await file.writeAsBytes(bytes);
  }
}

void main() async {
  final dataSource = ImageDataSourceImpl(client: http.Client());
  final bytes = await dataSource.fetchImage('https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202504/02/7d2e042d-ef79-4ea8-b9a3-07589e107e2c.jpg');

  dataSource.saveImage(bytes, '아이유.jpg');
}
