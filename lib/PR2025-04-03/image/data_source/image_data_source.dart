import 'package:modu_3_dart_study/PR2025-04-03/image/model/uint8list.dart';

abstract interface class ImageDataSource {
  Future<Uint8list> fetchImage(String url);

  Future<void> saveImage(Uint8list bytes, String path);
}
