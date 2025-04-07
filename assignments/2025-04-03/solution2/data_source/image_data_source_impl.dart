import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'image_data_source.dart';

class ImageDataSourceImpl implements ImageDataSource {
  @override
  Future<Uint8List> fetchImage(String url) async {
    final response = await http.get(Uri.parse(url));
    final imageListData = response.bodyBytes;
    return imageListData;
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) async {
    File file = File(path);
    await file.writeAsBytes(bytes, mode: FileMode.write);
    print('$path에 이미지가 저장되었습니다');
  }
}

class MockImageDataSourceImpl implements ImageDataSource {
  final MockClient client;

  const MockImageDataSourceImpl({required this.client});

  @override
  Future<Uint8List> fetchImage(String url) async {
    final response = await client.get(Uri.parse(url));
    final imageListData = response.bodyBytes;
    return imageListData;
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) async {
    File file = File(path);
    await file.writeAsBytes(bytes, mode: FileMode.write);
    print('$path에 이미지가 저장되었습니다');
  }
}
