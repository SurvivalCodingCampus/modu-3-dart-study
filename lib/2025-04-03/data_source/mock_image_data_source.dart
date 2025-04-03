import 'dart:typed_data';

import 'image_data_source.dart';

class MockImageDataSource implements ImageDataSource {
  final Map<String, Uint8List> simulatedStorage = {};

  @override
  Future<Uint8List> fetchImage(String url) async {
    // URL로부터 가짜 이미지 바이트 생성
    return Uint8List.fromList(List.generate(10, (i) => i));
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) async {
    simulatedStorage[path] = bytes;
  }
}
