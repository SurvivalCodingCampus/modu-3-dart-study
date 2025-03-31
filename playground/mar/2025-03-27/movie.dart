import 'dart:convert';

class Movie {
  String title;
  String director;
  int year;

  Movie.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      director = json['director'],
      year = json['year'];

  @override
  String toString() {
    return 'Movie{title: $title, director: $director, year: $year}';
  }
}

Future<Movie> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));

  final String jsonString = '''{
    "title": "Star Wars",
    "director": "George Lucas",
    "year": 1977
  }''';

  final jsonMap = jsonDecode(jsonString);

  return Movie.fromJson(jsonMap);
}
