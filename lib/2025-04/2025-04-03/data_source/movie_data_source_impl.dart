import 'dart:convert' show jsonDecode;

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04/2025-04-03/data_source/movie_data_source.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final http.Client _client;

  const MovieDataSourceImpl(this._client);

  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies(String url) async {
    Uri parsed = Uri.parse(url);
    http.Response response = await _client.get(parsed);
    List<dynamic> results = jsonDecode(response.body)['results'];

    return results.cast<Map<String, dynamic>>().toList();
  }
}
