import 'dart:convert';

// Movie 클래스는 함수 외부에 선언
class Movie {
  final String title;
  final String director;
  final int year;

  Movie({required this.title, required this.director, required this.year});

  // JSON을 객체로 변환하는 생성자
  Movie.fromJson(Map<String, dynamic> json)
      : title = json['title'] ?? '',        // 저번처럼 Null 값 피해주기~~~
        director = json['director'] ?? '',
        year = json['year'] ?? 0;
}

Future<Movie> getMovieInfo() async {
  // 올바른 JSON 문자열
  final String jsonString = '''{
    "title": "Star Wars",
    "director": "George Lucas",
    "year": 1977
  }''';

  // 2초 기다리기
  await Future.delayed(Duration(seconds: 2));
  
  // JSON 문자열을 Map<String, dynamic>으로 변환
  Map<String, dynamic> jsonMap = jsonDecode(jsonString);

  // Movie 객체 생성 후 반환
  return Movie.fromJson(jsonMap);
}

void main() async {
  Movie movie = await getMovieInfo();
  print('Title: ${movie.title}');
  print('Director: ${movie.director}');
  print('Year: ${movie.year}');
}