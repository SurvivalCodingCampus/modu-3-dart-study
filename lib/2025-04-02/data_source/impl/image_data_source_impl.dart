import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-02/data_source/image_data_source.dart';

class ImageDataSourceImpl implements ImageDataSource {
  ImageDataSourceImpl();

  @override
  Future<Uint8List> fetchImage(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes; //Unit8List 형태로 반환
    } else {
      throw Exception('이미지 다운로드가 실패했습니다.');
    }
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) async {
    final File file = File(path);
    await file.writeAsBytes(bytes);
  }
}
