
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(explicitToJson: true)
class Movie {
  final int id;
  final String title;
  final String overview;
  @JsonKey(name:'release_data')
  final String releaseData;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseData,
  });

  Movie copyWith({
    int? id,
    String? title,
    String? overview,
    String? releaseData,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      releaseData: releaseData ?? this.releaseData,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          overview == other.overview &&
          releaseData == other.releaseData;

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ overview.hashCode ^ releaseData.hashCode;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String,dynamic> toJson() => _$MovieToJson(this);
}
