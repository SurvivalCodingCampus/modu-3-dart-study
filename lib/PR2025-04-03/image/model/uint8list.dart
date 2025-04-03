import 'package:json_annotation/json_annotation.dart';

part 'uint8list.g.dart';

@JsonSerializable(explicitToJson: true)
class Uint8list {
  final String url;

  factory Uint8list.fromJson(Map<String, dynamic> json) =>
      _$Uint8listFromJson(json);

  Map<String, dynamic> toJson() => _$Uint8listToJson(this);

  const Uint8list({required this.url});
}
