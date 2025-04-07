import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/apr/w1/2025-04-03/movie/data_source/movie_data_source.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final http.Client client;

  MovieDataSourceImpl(this.client);

  String movieData =
      File(r'lib/apr/w1/2025-04-03/movie/movie.txt').readAsStringSync();

  String apiUrl =
      'https://api.themoviedb.org/3/movie/157336?api_key=db62ad7757737f4cf7101493c0bccdf2';

  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies() async {
    final response = await client.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      throw Exception('exciption');
    }
  }
}

void main() async {
  final client = http.Client();
  final data = MovieDataSourceImpl(client);
  await data.getUpcomingMovies();
  client.close();
}
