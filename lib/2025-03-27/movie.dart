class Movie {
  final String title;
  final String director;
  final String year;

  Movie({required this.title, required this.director, required this.year});

  Movie.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        director = json['director'],
        year = json['year'];

  Map<String, dynamic> toJson() {
    return {'title': title, 'director': director, 'year': year};
  }
}

