import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import 'image_data_source.dart';

class ImageDataSourceImpl implements ImageDataSource {
  @override
  Future<Uint8List> fetchImage(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        throw HttpException('이미지 다운로드 실패');
      }
    } catch (e) {
      throw HttpException('이미지 다운로드 실패 : ${e.toString()}');
    }
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) async {
    try {
      final file = File(path);
      final parent = file.parent;
      if (!parent.existsSync()) {
        parent.createSync(recursive: true);
      }
      await file.writeAsBytes(bytes);
    } catch (e) {
      throw FileSystemException('이미지 저장 실패: ${e.toString()}');
    }
  }

  @override
  Future<bool> exists(String path) {
    return File(path).exists();
  }
}
