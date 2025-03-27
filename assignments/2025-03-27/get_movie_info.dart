import 'dart:convert';

Future<Movie> getMovieInfo() async {
  Future.delayed(Duration(seconds: 2));

  final String jsonString = '''{
"title": "Star Ward",
"director": "George Lucas",
"year": 1977
}''';

  return Movie.fromJson(jsonDecode(jsonString));
}

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
    return 'title : $title, director : $director, year : $year';
  }
}

void main(List<String> args) async {
  final movie = await getMovieInfo();
  print(movie.director);
}
