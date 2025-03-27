import 'dart:convert';

class Movie {
  String title;
  String director;
  int year;

  Movie(this.title, this.director, this.year);

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "director": director,
      "year": year
    };
  }

  Movie.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        director = json['director'],
        year = json['year'];

  @override
  String toString() {
    return 'Movie{title: $title, director: $director, year: $year}';
  }
}

// Json 받고 Movie 클래스까지 생성하는 함수
Future<Movie> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2)); // 먼저 2초 기다림.

  final String jsonString = '''{
    "title": "Star Ward",
    "director": "George Lucas",
    "year": 1977
  }''';

  Map<String, dynamic> decodedJson = jsonDecode(jsonString);

  return Movie.fromJson(decodedJson);
}