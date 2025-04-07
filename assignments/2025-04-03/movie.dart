
part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final int id;
  final String title;
  final String overview;
  final String releaseData;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseData,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(json);
}