import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import 'image_data_source.dart';

class ImageDataSourceImpl implements ImageDataSource {
  @override
  Future<Uint8List> fetchImage(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        if (response.headers['content-type']?.startsWith('image') == true) {
          return response.bodyBytes;
        } else {
          throw Exception('잘못된 응답: 이미지가 아닙니다.');
        }
      } else {
        throw Exception('이미지를 가져오지 못했습니다. 상태 코드: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('이미지 가져오기 실패: $e');
    }
  }

  @override
  Future<void> saveImage(Uint8List bytes, String path) async {
    try {
      // 확장자 체크 후 추가 (없으면 .jpg로 저장)
      String filePath = path.contains('.') ? path : '$path.jpg';

      File file = File(filePath);
      await file.writeAsBytes(bytes);

      print('이미지 저장 완료: $filePath');
    } catch (e) {
      throw Exception('이미지 저장 실패: $e');
    }
  }
}
