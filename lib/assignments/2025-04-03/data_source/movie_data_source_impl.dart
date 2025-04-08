import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'movie_data_source.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final String url =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1';
  @override
  Future<List<Map<String, dynamic>>> getMovies() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        return jsonDecode(
          response.body,
        )['results'].cast<Map<String, dynamic>>();
      } else {
        throw HttpException('HTTP 오류 ${response.statusCode}');
      }
    } on HttpException catch (e) {
      throw HttpException('HTTP 오류 ${e.message}');
    } catch (e) {
      throw Exception('알 수 없는 오류 $e');
    }
  }
}
