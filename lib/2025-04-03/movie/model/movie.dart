import 'package:json_annotation/json_annotation.dart';
import 'package:modu_3_dart_study/utils/json_convertible.dart';

part 'movie.g.dart';

@JsonSerializable(explicitToJson: true)
class Movie implements JsonConvertible<Movie, int> {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, overview: $overview, releaseDate: $releaseDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Movie && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  const Movie({int? id, String? title, String? overview, String? releaseDate})
    : id = id ?? 0,
      title = title ?? '',
      overview = overview ?? '',
      releaseDate = releaseDate ?? '';

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  // TODO: implement filterKey
  int get filterKey => id;

  @override
  Movie fromJson(Map<String, dynamic> json) {
    return Movie.fromJson(json);
  }
}
