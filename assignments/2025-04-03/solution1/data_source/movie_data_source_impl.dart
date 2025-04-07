import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'movie_data_source.dart';

class MovieDataSourceImpl implements MovieDataSource {
  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies() async {
    final fetchData = await http.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1',
      ),
    );
    final Map<String, dynamic> getList = jsonDecode(fetchData.body);
    final List resultList = getList["results"];
    final List<Map<String, dynamic>> returnList =
        resultList.map((e) => e as Map<String, dynamic>).toList();

    return returnList;
  }

  @override
  Future<Map<String, dynamic>> mockGetUpcomingMovies({
    required MockClient mockClient,
  }) async {
    final mockData = await mockClient.get(
      Uri.parse('https://example.com'),
      headers: {'Content-Type': 'application/json'},
    );

    return jsonDecode(utf8.decode(mockData.bodyBytes)) as Map<String, dynamic>;
  }
}
