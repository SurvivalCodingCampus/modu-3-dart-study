import 'package:json_annotation/json_annotation.dart';
part 'movie.g.dart'; // 자동 생성될 파일

@JsonSerializable()
class Movie {
  final int id;
  final String title;
  final String overview;
  @JsonKey(name: 'release_date') // JSON 키와 변수명 매칭
  final String releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
  });

  // JSON -> 객체 변환
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  // 객체 -> JSON 변환
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}