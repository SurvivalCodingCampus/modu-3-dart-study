import 'dart:typed_data';

import 'package:modu_3_dart_study/assignments/2025-04-03/src/solution/data_source/image_data_source.dart';

class MockImageDataSourceImpl implements ImageDataSource {
  @override
  Future<Uint8List> fetchImage(String url) {
    // TODO: implement fetchImage
    throw UnimplementedError();
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) {
    // TODO: implement saveImage
    throw UnimplementedError();
  }
}
