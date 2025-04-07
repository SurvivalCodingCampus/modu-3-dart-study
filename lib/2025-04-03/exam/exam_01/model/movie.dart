import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          overview == other.overview &&
          releaseDate == other.releaseDate;

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ overview.hashCode ^ releaseDate.hashCode;

  @override
  String toString() {
    return 'Movie{id: $id, title: $title, overview: $overview, releaseDate: $releaseDate}';
  }

  Movie copyWith({
    int? id,
    String? title,
    String? overview,
    String? releaseDate,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }
}
