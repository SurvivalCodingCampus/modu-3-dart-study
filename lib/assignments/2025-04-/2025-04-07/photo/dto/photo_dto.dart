import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PhotoDto {
  final String? tags;
  final String? previewURL;

  PhotoDto({
    this.tags,
    this.previewURL,
  });

  factory PhotoDto.fromJson(Map<String, dynamic> json) => _$PhotoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PhotoResultDto {
  final int? total;
  final int? totalHits;
  final List<PhotoDto> hits;

  PhotoResultDto({
    this.total,
    this.totalHits,
    required this.hits,
  });

  factory PhotoResultDto.fromJson(Map<String, dynamic> json) {
    return PhotoResultDto(
      total: json['total'] as int?,
      totalHits: json['totalHits'] as int?,
      hits: (json['hits'] as List<dynamic>?)
              ?.map((e) => PhotoDto.fromJson(e as Map<String, dynamic>))
              .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() => _$PhotoResultDtoToJson(this);
}