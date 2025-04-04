import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(explicitToJson: true) //객체 내에 다른 객체가 포함된 경우 toJson()을 자동으로 호출하도록 설정
class Movie {
  final int id;
  final String title;
  final String overview;
  final String? releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
  });
  
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  String toString() {
    return 'Movie{id: $id, title: $title, overview: $overview, releaseDate: $releaseDate}';
  }

}