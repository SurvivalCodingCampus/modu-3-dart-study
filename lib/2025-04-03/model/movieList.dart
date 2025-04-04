import 'package:json_annotation/json_annotation.dart';

import 'movie.dart';

part 'movieList.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieList {
  final List<Movie> results;

  const MovieList({required this.results});

  factory MovieList.fromJson(Map<String, dynamic> json) =>
      _$MovieListFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListToJson(this);
}
