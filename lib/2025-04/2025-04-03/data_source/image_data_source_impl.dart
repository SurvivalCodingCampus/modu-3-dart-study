import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04/2025-04-03/data_source/image_data_source.dart';

class ImageDataSourceImpl implements ImageDataSource {
  final http.Client _client;

  ImageDataSourceImpl(this._client);

  @override
  Future<Uint8List> fetchImage(String url) async {
    Uri parsed = Uri.parse(url);
    http.Response response = await _client.get(parsed);

    return response.bodyBytes;
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) async {
    await File(path).writeAsBytes(bytes);
  }
}
