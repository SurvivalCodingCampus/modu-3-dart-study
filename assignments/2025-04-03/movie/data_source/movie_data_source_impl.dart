import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'movie_data_source.dart';

class MovieDataSourceImpl implements MovieDataSource {
  // static const testData = {
  //   "id": 939243,
  //   "title": "수퍼 소닉 3",
  //   "overview": "너클즈, 테일즈와 함께 평화로운 일상을 보내던 초특급 히어로 소닉...",
  //   "release_date": "2024-12-19",
  // };

  static final testData =
      File(
        'assignments/2025-04-03/movie/data_source/mock_data.json',
      ).readAsStringSync();

  final String url;
  final http.Client client;

  MovieDataSourceImpl({required this.url, client})
    : client = client ?? http.Client();

  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies() async {
    final response = await client.get(Uri.parse(url));
    // print(response);
    if (response.statusCode == 200) {
      final jsonList =
          jsonDecode(utf8.decode(response.bodyBytes))['results'] as List;
      final movieList = jsonList.map((e) => e as Map<String, dynamic>).toList();
      return movieList;
    }
    throw UnimplementedError();
  }
}
