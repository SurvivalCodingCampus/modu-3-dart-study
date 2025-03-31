import 'dart:convert';

import 'movie.dart';

Future<Movie> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));

  final String jsonString = '''{
      "title" : "StarWord",
     "director": "George Lucas",
     "year"  : "1977"
      }
      ''';
  Map<String, dynamic> json = jsonDecode(jsonString);

  return Movie.fromJson(json);
}


void main() async {
   Movie data = await getMovieInfo();
   print('director :${data.director}');
}
