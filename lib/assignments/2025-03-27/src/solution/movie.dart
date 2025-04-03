// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Movie {
  String title;
  String director;
  int year;

  Movie({required this.title, required this.director, required this.year});

  Movie.fromJson(Map<String, dynamic> json)
    : title = json['title'] ?? '',
      director = json['director'] ?? '',
      year = json['year'] ?? 0;
}

void main() async {
  Future<Movie> getMovieInfo() async {
    await Future.delayed(Duration(seconds: 2));

    final String jsonString = '''
      { 
        "title": "Star Ward",
        "director": "George Lucas",
        "year": 1977
      }
    ''';

    return Movie.fromJson(jsonDecode(jsonString));
  }

  Movie movie = await getMovieInfo();

  print(movie.director);
}
