import 'dart:convert';
import '../2025-03-25/default_file_operations.dart';

class Movie {
  String title;
  String director;
  int year;

  Movie({required this.title, required this.director, required this.year});

  Movie.fromJson(Map<String, dynamic> json)
    : title = json['title'] as String? ?? '제목 없음',
      director = json['director'] as String? ?? '미상',
      year = json['year'] as int? ?? 1900;

  Map<String, dynamic> toJson() => {
    'title': title,
    'director': director,
    'year': year,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          director == other.director &&
          year == other.year;

  @override
  int get hashCode => title.hashCode ^ director.hashCode ^ year.hashCode;
}

Future<Movie> getMovieInfo() async {
  final defaultFileOperation = DefaultFileOperations();
  await Future.delayed(const Duration(seconds: 2));
  final String jsonString = defaultFileOperation.read('assignment/2025-03-27/movie.json');
  final json = jsonDecode(jsonString);
  final movie = Movie.fromJson(json);
  return movie;
}