import 'package:json_annotation/json_annotation.dart';

import 'store_dto.dart';

part 'store_list_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class StoreListDto {
  List<StoreDto> stores;

  StoreListDto({required this.stores});

  factory StoreListDto.fromJson(Map<String, dynamic> json) => _$StoreListDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StoreListDtoToJson(this);
}
