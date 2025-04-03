import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-03/movie/data_source/movie_data_source.dart';

class MovieDataSourceImpl implements MovieDataSource {
  static const String apiUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1';

  @override
  Future<Map<String, dynamic>> getItem() async {
    final httpData = await http.get(Uri.parse(apiUrl));
    if (httpData.statusCode == 200) {}
    return {};
  }

  @override
  Future<List<Map<String, dynamic>>> getItems() async {
    final httpData = await http.get(Uri.parse(apiUrl));
    if (httpData.statusCode == 200) {
      final String httpBody = httpData.body;
      final Map<String, dynamic> httpJson = jsonDecode(httpBody);
      final List<dynamic> result = httpJson['results'];

      return result.map((e) => e as Map<String, dynamic>).toList();
    }
    return [];
  }
}
