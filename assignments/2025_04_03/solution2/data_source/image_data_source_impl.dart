import 'dart:io';
import 'dart:typed_data';

import 'image_data_source.dart';
import 'package:http/http.dart' as http;

class ImageDataSourceImpl implements ImageDataSource {
  @override
  Future<Uint8List> fetchImage(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      final bytes = response.bodyBytes;

      return bytes;
    } catch (e) {
      throw Exception('오류 발생 $e.');
    }
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) async {
    try {
      File(path).writeAsBytes(bytes);
    } catch (e) {
      throw Exception('오류 발생 $e.');
    }
  }
}
