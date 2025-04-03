import 'package:json_annotation/json_annotation.dart';

part 'dates.g.dart';

@JsonSerializable(explicitToJson: true)
class Dates {
  final DateTime maximum;
  final DateTime minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);

  Map<String, dynamic> toJson() => _$DatesToJson(this);
}