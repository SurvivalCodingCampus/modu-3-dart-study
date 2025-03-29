import 'package:modu_3_dart_study/2025-03-27/solution1/Movie.dart';

class Movies {
  List<Movie> movies;

  Movies.name(this.movies);

  Movies.fromJson(Map<String, dynamic> json)
    : movies = List<Movie>.from(
        json["movies"].map((data) => Movie.fromJson(data)),
      );
}
