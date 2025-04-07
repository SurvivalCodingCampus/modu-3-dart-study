import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:modu_3_dart_study/2025-04-03/exam/exam_01/data_source/movie_data_source.dart';

class DioMovieDataSourceImpl implements MovieDataSource {
  final dio = Dio();

  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies() async {
    try {
      final Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1',
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load movies');
      }

      List jsonList = response.data['results'];
      return jsonList.cast<Map<String, dynamic>>();
    } catch (e) {
      throw Exception('인터넷 연결 오류');
    }
  }
}
