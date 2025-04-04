import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/image/data_source/image_data_source.dart';

class ImageDataSourceImpl implements ImageDataSource {
  @override
  Future<Uint8List> fetchImage(String url) async {
    final resp = await http.get(Uri.parse(url));
    if (resp.statusCode != 200) {
      throw Exception('이미지 가져오는 도중 발생');
    }
    final bytes = resp.bodyBytes;
    return bytes;
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) async {
    try {
      final file = File(path);
      await file.writeAsBytes(bytes, mode: FileMode.write);
    } catch (e) {
      throw Exception('파일 저장중 에러 발생');
    }
  }
}
