class Movie {
  final String title;
  final String director;
  final int year;

  Movie.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      director = json['director'],
      year = json['year'];
}
