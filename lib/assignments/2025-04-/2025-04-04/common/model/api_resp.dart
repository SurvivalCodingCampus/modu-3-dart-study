import 'package:json_annotation/json_annotation.dart';

part 'api_resp.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiResp {
  final int count;
  final List<Map<String, dynamic>> stores;

  ApiResp({required this.count, required this.stores});

  factory ApiResp.fromJson(Map<String, dynamic> json) =>
      _$ApiRespFromJson(json);

  Map<String, dynamic> toJson() => _$ApiRespToJson(this);
}
