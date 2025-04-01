import 'dart:convert';

Future<Movie> getMovieInfo() {
  final String jsonString;

  Map<String, dynamic> jsonMap = jsonDecode(jsonString);

  return Future.delayed(Duration(seconds: 2));
}

class Movie {
  String title;
  String director;
  int year;

  Movie.name(this.title, this.director, this.year);

}

