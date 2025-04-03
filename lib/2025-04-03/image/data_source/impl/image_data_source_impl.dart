import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-03/image/data_source/image_data_source.dart';

class ImageDataSourceImpl implements ImageDataSource {
  @override
  Future<Uint8List> fetchImage(String url) async {
    final httpData = await http.get(Uri.parse(url));
    if (httpData.statusCode == 200) {
      return httpData.bodyBytes;
    }

    return Uint8List.fromList([]);
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) async {
    final File imageFile = File(path);

    await imageFile.writeAsBytes(bytes);
  }
}
