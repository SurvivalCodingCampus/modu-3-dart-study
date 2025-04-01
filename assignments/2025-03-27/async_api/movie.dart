import 'dart:convert';

class Movie {
  String title;
  String director;
  String year;

  Movie({required this.title, required this.director, required this.year});

}

Future<Movie> getMovieInfo() async {
  //TODO: 2초동안 기다리는 코드 작성
  await Future.delayed(Duration(seconds: 2));

  final String jsonString = '''{
    "title": "Star Wars",
    "director": "George Lucas",
    "year": 1977
  }''';

  //TODO: Movie 데이터 클래스를 리턴하도록 작성
  final Map<String, dynamic> movieInfoMap = jsonDecode(jsonString);

  final Movie movie = Movie(
    title: movieInfoMap['title'] as String,
    director: movieInfoMap['director'] as String,
    year: movieInfoMap['year'].toString(),
  );

  return movie;
}


Future<void>  main() async {

  final Movie movie = await getMovieInfo();
  // 디렉터 이름 출력
  print (movie.director);
}

