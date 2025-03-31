import 'dart:convert';

// Future<Movie> getMovieInfo() async {
//   //json 형태로 선언
//   final String jsonString = '''{
//   "title" : "Star Wars",
//   "director" : "George Lucas",
//   "openYear" : 1977
//   }''';
//   //json을 Map형식으로 역직렬화해줌
//   try {
//     final Map<String, dynamic> json = jsonDecode(jsonString);
//     // json 데이터를 Movie객체로 변환, 역직렬화
//     final Movie movie = Movie.fromJson(json);
//     //movie 객체 반환
//     return movie;
//   } catch (e) {
//     throw Exception('영화 정보를 파싱하는 중 오류가 발생했습니다');
//   }
// }

Future<Movie> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));

  //json 형태로 선언
  final Map<String, dynamic> json = {
    "title": "Star Wars",
    "director": "George Lucas",
    "openYear": 1977,
  };
  //json을 Map형식으로 역직렬화해줌
  return Movie.fromJson(json);
}

class Movie {
  final String title;
  final String director;
  final int openYear;

  Movie({required this.title, required this.director, required this.openYear});

  Map<String, dynamic> toJson() {
    return {'title': title, 'director': director, 'openYear': openYear};
  }

  // Movie.fromJson(Map<String, dynamic> json)
  //     : title = json['title'],
  //       director = json['director'],
  //       openYear = json['openYear'];
  // factory방식으로도 사용 가능
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      director: json['director'],
      openYear: json['openYear'],
    );
  }
}

void main() async {
  Movie movie = await getMovieInfo();
}
