import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

import '../image_data_source.dart';

class ImageDataSourceImpl implements ImageDataSource {
  final http.Client _client;

  ImageDataSourceImpl({http.Client? client}) : _client = client ?? http.Client();

  @override
  Future<Uint8List> fetchImage(String url) async {
    final parsedUrl = Uri.parse(url);
    return await _client.readBytes(parsedUrl);
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) async {
    final directory = p.dirname(path);
    final Directory dir = Directory(directory);

    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }

    File file = File(path);
    await file.writeAsBytes(bytes);

    print('🌉 이미지가 성공적으로 저장되었습니다: ${path}');
  }
}
