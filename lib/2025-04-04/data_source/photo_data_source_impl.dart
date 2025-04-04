import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-04/data_source/photo_data_source.dart';

import '../dto/photo_dto.dart';

class PhotoDataSourceImpl implements PhotoDataSource{
  final String _url;

  const PhotoDataSourceImpl({
    required String url,
  }) : _url = url;

  @override
  Future<List<PhotoDto>> getPhotos() async {
    try {
      final response = await http.get(Uri.parse(_url));

      if(response.statusCode == 200) {
        final List<dynamic> photos = await jsonDecode(utf8.decode(response.bodyBytes));

        return photos.map((e) => PhotoDto.fromJson(e)).toList();
      } else {
        throw Exception('url 정보 로딩 실패');
      }
    } catch(e) {
      throw Exception('인터넷 연결 오류: $e');
    }
  }
}