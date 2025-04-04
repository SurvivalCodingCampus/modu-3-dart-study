import 'package:json_annotation/json_annotation.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/common/model/dates.dart';

part 'api_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class ApiResponse {
  final Dates dates;
  final int page;
  final List<Map<String, dynamic>> results;

  ApiResponse({
    required this.dates,
    required this.page,
    required this.results,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}