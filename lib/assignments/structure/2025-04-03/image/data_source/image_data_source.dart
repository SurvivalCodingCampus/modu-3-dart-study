import 'dart:typed_data';

abstract interface class ImageDataSource {
  // 이미지 가져오기
  Future<Uint8List> fetchImage(String url);

  // 이미지 저장
  Future<void> saveImage(Uint8List bytes, String path);
}