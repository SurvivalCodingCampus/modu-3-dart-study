import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-03/solution2/repository/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {



  @override
  Future<void> saveImage(String url, String path) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    File file = File(path);
    await file.writeAsBytes(bytes, mode: FileMode.write);
    print('$path에 이미지가 저장되었습니다');
  }

  @override
  Future<void> saveImages(List<String> urls, String directory) async {
    Directory targetDir = await Directory(directory).create(recursive: true);
    int imageNum = 0;
    for (String url in urls) {
      imageNum++;
      await saveImage(url, '${targetDir.path}/$imageNum.png');
    }
  }
}
