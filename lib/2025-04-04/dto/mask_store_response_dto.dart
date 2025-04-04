import 'package:json_annotation/json_annotation.dart';

import 'mask_store_dto.dart';

part 'mask_store_response_dto.g.dart';

@JsonSerializable()
class MaskStoreResponseDto {
  final int count;
  final List<MaskStoreDto> stores;

  MaskStoreResponseDto({required this.count, required this.stores});

  factory MaskStoreResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MaskStoreResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MaskStoreResponseDtoToJson(this);
}
