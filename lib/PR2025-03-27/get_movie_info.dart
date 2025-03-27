import 'dart:convert';

Future<Movie> getMovieInfo() async {
  //json 형태로 선언
  final String jsonString = '''{
  "title" : "Star Wars",
  "director" : "George Lucas",
  "openYear" : 1977
  }''';
  //json을 Map형식으로 역직렬화해줌
  final Map<String, dynamic> json = jsonDecode(jsonString);
  // json 데이터를 Movie객체로 변환, 역직렬화
  final Movie movie = Movie.fromJson(json);
  //movie 객체 반환
  return movie;
}

class Movie {
  final String title;
  final String director;
  final int openYear;

  Movie({required this.title, required this.director, required this.openYear});

  Map<String, dynamic> toJson() {
    return {'title': title, 'director': director, 'openYear': openYear};
  }

  Movie.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      director = json['director'],
      openYear = json['openYear'];
}
