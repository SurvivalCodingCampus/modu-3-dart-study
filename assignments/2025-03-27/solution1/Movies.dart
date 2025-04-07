import 'Movie.dart';

class Movies {
  List<Movie> movies;

  Movies.name(this.movies);

  Movies.fromJson(Map<String, dynamic> json)
    : movies = List<Movie>.from(
        json["movies"].map((data) => Movie.fromJson(data)),
      );
}
