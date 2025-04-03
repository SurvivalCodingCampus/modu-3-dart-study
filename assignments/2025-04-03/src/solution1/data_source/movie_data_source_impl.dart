import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-03/data_source/movie_data_source.dart';

class MovieDataSourceImpl implements MovieDataSource {

  final http.Client _client;
  final String _uri;

  MovieDataSourceImpl({
    http.Client? client,
    required String uri,
  })
      : _client = client ?? http.Client(),
        _uri = uri;

  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies() async {
    final response = await _client.get(Uri.parse(_uri));
    final json = await jsonDecode(utf8.decode(response.bodyBytes));
    final List<dynamic> results = json['results'];

    if(response.statusCode != 200) {
      throw Exception('API 호출 오류');
    }

    return results.map((movie) {
      return {
        'id': movie['id'],
        'title': movie['title'],
        'overview': movie['overview'],
        'release_date': movie['release_date'],
      };
    }).toList();
  }
}