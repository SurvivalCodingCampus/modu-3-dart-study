import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/data_source/25-04-07/photo_data_source.dart';
import 'package:modu_3_dart_study/dto/25-04-07/photo_dto.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final http.Client client;
  PhotoDataSourceImpl({http.Client? client}) : client = client ?? http.Client();
  @override
  Future<List<PhotoDto>> getImages(String query) async {
    final response = await client.get(
      Uri.parse(
        'https://pixabay.com/api/?key=49670593-bee5da7fd8183765b82289d9b&q=$query&image_type=photo',
      ),
    );
    if (response.statusCode == 200) {
      final decoded = utf8.decode(response.bodyBytes);
      final photoDto = PhotoDto.fromJson(json.decode(decoded)['hits']);
      return [photoDto];
    } else {
      throw ('로드 실패');
    }
  }
}
