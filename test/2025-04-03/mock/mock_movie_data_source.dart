import 'dart:convert';
import 'dart:typed_data';

import 'package:modu_3_dart_study/2025-04-03/movie/data_source/impl/movie_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/movie/data_source/movie_data_source.dart';
import 'package:http/http.dart' as http;

class MockMovieDataSource implements MovieDataSource {
  final http.Client _client;

  MockMovieDataSource(this._client);

  @override
  Future<Map<String, dynamic>> getItem() async {
    return {};
  }

  @override
  Future<List<Map<String, dynamic>>> getItems() async {
    final httpData = await _client.get(Uri.parse(MovieDataSourceImpl.apiUrl));
    if (httpData.statusCode == 200) {
      final Uint8List httpBody = httpData.bodyBytes;
      final Map<String, dynamic> httpJson = jsonDecode(utf8.decode(httpBody));
      final List<dynamic> result = httpJson['results'];

      return result.map((e) => e as Map<String, dynamic>).toList();
    }
    return [];
  }
}
