import 'dart:convert';

class Movie {
  final String title;
  final String director;
  final int year;

  Movie(this.title, this.director, this.year);

  Movie.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      director = json['director'],
      year = json['year'];

  Map<String, dynamic> toJson() => {
    'title': title,
    'director': director,
    'year': year,
  };

  Future<Movie> getMovieInfoInner(String jsonString) async {
    await Future.delayed(Duration(seconds: 2));

    try {
      return Movie.fromJson(jsonDecode(jsonString));
    } on FormatException {
      throw ArgumentError('Json 형식에 맞는 데이터를 삽입해주세요.');
    }
  }
}

Future<Movie> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));

  try {
    final String jsonString = '''{
      "title": "Star Ward",
      "director": "George Lucas",
      "year":1977
    }''';

    return Movie.fromJson(jsonDecode(jsonString));
  } on FormatException {
    throw ArgumentError('Json 형식에 맞는 데이터를 삽입해주세요.');
  }
}
