import 'dart:convert';

class Movie {
  String title;
  String director;
  int year;

  Movie(this.title, this.director, this.year);

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
  // 2초동안 기다리는 코드
  await Future.delayed(Duration(seconds: 2));
  final String jsonString =
      '''{ "title" : "Star Wars", "director" : "George Lucas", "year" : 1977}''';
  final Map<String, dynamic> data = jsonDecode(jsonString);
  final Movie movie = Movie.fromJson(data);
  //Movie 데이터 클래스를 리턴하도록 작성 역직렬화
  return movie;
}

void main() async {
  Movie movie = await getMovieInfo();
  print(movie);
  print(movie.director);
}
