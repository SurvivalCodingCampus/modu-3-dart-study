import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-07/core/error.dart';
import 'package:modu_3_dart_study/2025-04-07/core/result.dart';
import 'package:modu_3_dart_study/2025-04-07/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/dto/photo_dto.dart';

class HttpPhotoDataSource implements PhotoDataSource {
  final String _apiKey;
  final http.Client _client;

  HttpPhotoDataSource({
    http.Client? client,
    String apiKey = '49670331-b0e47e0723424be62ba8dac16',
  }) : _apiKey = apiKey,
       _client = client ?? http.Client();

  @override
  Future<List<PhotoDto>> getPhotos(String query) async {
    // 금지어 필터링 먼저
    if (query.contains('바보')) {
      throw Result.error(ImageError.invalidWord);
    }
    try {
      final uri = Uri.parse('https://pixabay.com/api/?key=$_apiKey&q=$query');
      final response = await _client.get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final hits = json['hits'] as List<dynamic>;

        return hits
            .map(
              (e) => PhotoDto.fromJson({
                'tags': e['tags'],
                'imageUrl': e['webformatURL'],
              }),
            )
            .toList();
      } else {
        throw Exception('Network error');
      }
    } finally {
      _client.close();
    }
  }

  void dispose() {
    _client.close();
  }
}
