import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

//json하고 tab 키 누르면 자동완성
@JsonSerializable(explicitToJson: true)
class Movie {
  final int id;
  final String title;
  final String overview;
  @JsonKey(name: 'release_date')
  final String? releaseDate;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    this.releaseDate,
  });

  // @override
  // String toString() {
  //   return 'Movie{id: $id, title: $title, overview: $overview, releaseDate: ${releaseDate ?? 'Unknown'}}';
  // }
}
