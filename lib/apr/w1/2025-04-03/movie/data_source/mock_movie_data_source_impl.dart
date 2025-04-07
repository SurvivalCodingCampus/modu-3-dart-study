import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/apr/w1/2025-04-03/movie/data_source/movie_data_source.dart';

class MockMovieDataSourceImpl implements MovieDataSource {
  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies() async {
    final file = File(r'lib/apr/w1/2025-04-03/movie/movie.txt');
    final jsonBytes = await file.readAsBytes();

    final jsonString = utf8.decode(jsonBytes);
    final data = jsonDecode(jsonString) as Map<String, dynamic>;

    return [data];
  }
}
