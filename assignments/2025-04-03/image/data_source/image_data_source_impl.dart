import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import 'image_data_source.dart';

class ImageDataSourceImpl implements ImageDataSource {
  @override
  Future<Uint8List> fetchImage(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final image = response.bodyBytes;
      return image;
    }
    throw Exception(
      '이미지를 가져오는데 실패했습니다. 상태 코드: ${response.statusCode}, 응답: ${response.body}',
    );
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) async {
    File saveFile = File(path);
    await saveFile.writeAsBytes(bytes);
    // throw UnimplementedError();
  }
}
