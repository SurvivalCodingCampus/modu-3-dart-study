import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:modu_3_dart_study/assignments/2025-04-04/photo/data_source/remote/photo_remote_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/dto/photo_dto.dart';

class PhotoRemoteDataSourceImpl implements PhotoRemoteDataSource {
  final String _url;
  final http.Client _client;

  PhotoRemoteDataSourceImpl({required String url, required http.Client client})
    : _url = url,
      _client = client;

  @override
  Future<List<PhotoDto>> getDtoPhotoList() async {
    try {
      final response = await _client.get(Uri.parse(_url));
      if (response.statusCode == 200) {
        final List body = jsonDecode(response.body);
        final List<Map<String, dynamic>> jsonList =
            body.map((e) => e as Map<String, dynamic>).toList();
        final List<PhotoDto> photoDtoList =
            jsonList.map((e) => PhotoDto.fromJson(e)).toList();
        return photoDtoList;
      }
    } catch (e) {
      throw Exception('Failed to fetch photos: $e');
    }
    throw Exception();
  }
}
