import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final int id;
  final String title;
  final String overview;
  @JsonKey(name: 'release_date')
  final String releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Movie &&
        other.id == id &&
        other.title == title &&
        other.overview == overview &&
        other.releaseDate == releaseDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        overview.hashCode ^
        releaseDate.hashCode;
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

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, overview: $overview, releaseDate: $releaseDate)';
  }
}

void main() {
  Movie movie = Movie(
    id: 1,
    title: '하하',
    overview: '허더겅거덩스',
    releaseDate: '2025-04-04',
  );

  Map<String, dynamic> movieJson = movie.toJson();
  print(movieJson);

  Movie newMovie = Movie.fromJson(movieJson);
  print(newMovie);
}
