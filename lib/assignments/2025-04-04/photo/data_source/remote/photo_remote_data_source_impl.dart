import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/data_source/photo_data_source.dart';

import 'package:modu_3_dart_study/assignments/2025-04-04/photo/dto/photo_dto.dart';

class PhotoRemoteDataSourceImpl implements PhotoDataSource {
  final String _url;
  final http.Client _client;
  final Duration _timeout;

  PhotoRemoteDataSourceImpl({required String url, required http.Client client})
    : _url = url,
      _client = client,
      _timeout = Duration(seconds: 10);

  @override
  Future<List<PhotoDto>> getDtoPhotoList() async {
    try {
      final response = await _client
          .get(Uri.parse(_url))
          .timeout(
            _timeout,
            onTimeout: () {
              throw TimeoutException('시간 초과');
            },
          );
      if (response.statusCode == 200) {
        final List body = jsonDecode(response.body);
        final List<Map<String, dynamic>> jsonList =
            body.map((e) => e as Map<String, dynamic>).toList();
        final List<PhotoDto> photoDtoList =
            jsonList.map((e) => PhotoDto.fromJson(e)).toList();
        return photoDtoList;
      }
      throw Exception(
        'Failed to fetch photos: HTTP status ${response.statusCode}',
      );
    } catch (e) {
      throw Exception('Failed to fetch photos: $e');
    }
  }
}
