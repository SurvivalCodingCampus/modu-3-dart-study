import 'dart:convert';

class Movie {
  final String? title;
  final String? director;
  final int? year;

  Movie({this.director, this.title, this.year});

  Movie.fromJson(Map<String, dynamic> json)
    : title = json['title'] ?? '',
      director = json['director'] ?? '',
      year = json['year'] ?? 0;

  Future<Movie> getMovieInfo() async {
    print('데이터 들어오는중');
    await Future.delayed(Duration(seconds: 2));

    final String jsonString = '''{
      "title": "Star Wars",
      "director": "George Lucas",
      "year": 1977
    }''';
    print('데이터 받기 성공');

    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    print(jsonData);

    return Movie.fromJson(jsonData);
  }
}
