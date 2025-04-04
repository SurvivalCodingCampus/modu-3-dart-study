import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-02/data_source/movie_data_source.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final http.Client _client;
  final String _apiUri;

  MovieDataSourceImpl({
    http.Client? client,
    required String apiUri,
  }) : _client = client ?? http.Client(),
        _apiUri = apiUri;


  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovie() async {
    final response = await _client.get(Uri.parse(_apiUri));

    if (response.statusCode == 200) {
      final String jsonString = utf8.decode(response.bodyBytes); //테스트 완료
      //final String jsonString = response.body; // 한글 에러

      final List<dynamic> movies = jsonDecode(jsonString)['results'];
      return List<Map<String, dynamic>>.from(movies);
    } else {
      throw Exception('Movie 데이터를 가져오는데 실패했습니다.');
    }
  }


}
