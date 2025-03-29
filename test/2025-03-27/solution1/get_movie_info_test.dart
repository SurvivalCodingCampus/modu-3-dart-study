@Timeout(Duration(seconds: 500))
import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-27/solution1/Movie.dart';
import 'package:modu_3_dart_study/2025-03-27/solution1/getMovieInfo.dart';

import 'package:test/test.dart';

void main() async {
  test('', () async {
    final String getData =
        await File("lib/2025-03-27/solution1/movies_info.json").readAsString();

    final Map<String, dynamic> data = jsonDecode(getData);

    final movieData = data["movies"] as List;

    for (Map<String, dynamic> movieItems in movieData) {
      final Movie movie = await getMoiveInfo(movieData: movieItems);
      expect(movie.title, movieItems["title"]);
      expect(movie.originalTitle, movieItems["original_title"]);
      expect(movie.description, movieItems["description"]);
      expect(movie.genre, movieItems["genre"]);
    }
  });
}
