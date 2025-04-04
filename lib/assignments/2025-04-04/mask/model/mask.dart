
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mask.freezed.dart';
part 'mask.g.dart';

@freezed
abstract class Mask with _$Mask{
  const factory Mask({
    required String name,
    required String address,
    required String remainStat,
    required DateTime stockAt,
    required DateTime createdAt,
    required double lat,
    required double lng,
    required int code,
  }) = _Mask;

  factory Mask.fromJson(Map<String, dynamic> json) => _$MaskFromJson(json);

}