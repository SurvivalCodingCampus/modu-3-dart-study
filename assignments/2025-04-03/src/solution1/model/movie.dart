import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(explicitToJson: true) // 복잡한 구조로 된 애들까지 해결 옵션
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

  @override
  String toString() {
    return 'Movie{id: $id, title: $title, overview: $overview, releaseDate: $releaseDate}';
  }

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}