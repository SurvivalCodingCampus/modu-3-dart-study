import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/dto/photo_dto.dart';

class PhotoRemoteDataSourceImpl implements PhotoDataSource {
  final http.Client _client;
  
  static const String baseUrl = 'https://pixabay.com/api';

  PhotoRemoteDataSourceImpl({required http.Client client})
    : _client = client;

  @override
  Future<List<PhotoDto>> getPhotos(String query) async {
    try {
      final response = await _client.get(Uri.parse('$baseUrl/$query'));
      if (response.statusCode == 200) {
        final jsonString = response.body;
        final jsonList = jsonDecode(jsonString)["hits"] as List;
        return jsonList
            .map((e) => e as Map<String, dynamic>)
            .map((e) => PhotoDto.fromJson(e))
            .toList();
      }
    } catch (e) {
      throw Exception('http 요청 에러');
    }

    throw UnimplementedError();
  }
}
