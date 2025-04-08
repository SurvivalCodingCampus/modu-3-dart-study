import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import 'image_data_source.dart';

class ImageDataSourceImpl implements ImageDataSource {
  @override
  Future<Uint8List> fetchImage(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception("이미지 불러오기 실패 $url");
    }
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) async {
    final file = File(path);
    await file.writeAsBytes(bytes);
  }
}
