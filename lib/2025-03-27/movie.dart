import 'dart:convert';
import 'dart:async';

class Movie {
  final String title;
  final String director;
  final int year;

  Movie({required this.title, required this.director, required this.year});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      director: json['director'],
      year: json['year'],
    );
  }
}

Future<Movie> getMovieInfo() async {
  final String jsonString = '''{
    "title": "Star Wars",
    "director": "George Lucas",
    "year": 1977
  }''';

  await Future.delayed(Duration(seconds: 2));

  final Map<String, dynamic> jsonData = jsonDecode(jsonString);

  return Movie.fromJson(jsonData);
}
