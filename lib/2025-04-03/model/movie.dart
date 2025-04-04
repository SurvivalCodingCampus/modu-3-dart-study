import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(explicitToJson: true)
class Movie {
  final int id;
  final String title;
  final String overview;

  @JsonKey(name: 'release_date')
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
