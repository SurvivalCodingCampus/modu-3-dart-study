import 'dart:typed_data';

abstract interface class ImageDataSource {
  Future<Uint8List> fetchImage(String url);
  Future<void> saveImage(Uint8List bytes, String path);
}
