import 'dart:io';

import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/PR2025-04-03/image/data_source/image_data_source.dart';

class ImageDataSourceImpl implements ImageDataSource {
  @override
  Future<Uint8List> fetchImage(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('이미지를 못불러옴');
    }
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) async {
    final File file = File(path);
    await file.writeAsBytes(bytes);
  }
}
