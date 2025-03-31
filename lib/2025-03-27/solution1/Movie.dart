class Movie {
  String title;
  String originalTitle;
  String description;
  List genre;
  int year;
  double rating;

  @override
  String toString() {
    // TODO: implement toString
    return 'Movie{ title : $title, originalTitle : $originalTitle, '
        'description : $description, genre :$genre, year : $year, rating : '
        '$rating }';
  }

  Map<String, dynamic> toJson() => {
    "title": title,
    "originalTitle": originalTitle,
    "genre": genre,
    "year": year,
    "rating": rating,
    "description": description,
  };

  Movie.fromJson(Map<String, dynamic> json)
    : title = json["title"],
      originalTitle = json["original_title"],
      description = json["description"],
      genre = json["genre"],
      year = json["year"],
      rating = json["rating"];

  Movie({
    required this.title,
    required this.originalTitle,
    required this.description,
    required this.genre,
    required this.year,
    required this.rating,
  });
}
