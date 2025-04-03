import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-03/data_source/image_data_source.dart';

class ImageDataSourceImpl implements ImageDataSource {
  final http.Client _client;

  ImageDataSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  @override
  Future<Uint8List> fetchImage(String url) async {
    final response = await _client.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('이미지를 가져오는데 실패했습니다. 상태 코드: ${response.statusCode}');
    }
    return response.bodyBytes;
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) async {
    final File file = File(path);
    await file.writeAsBytes(bytes);
  }
}
