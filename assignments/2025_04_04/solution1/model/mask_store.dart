import 'package:freezed_annotation/freezed_annotation.dart';

part 'mask_store.freezed.dart';

@freezed
class MaskStore with _$MaskStore {
  @override
  final String address;
  @override
  final String name;
  @override
  final String remainStat;
  @override
  final int code;
  @override
  DateTime? stockAt;
  @override
  DateTime? createdAt;

  MaskStore({
    required this.address,
    required this.name,
    required this.remainStat,
    required this.code,
    this.stockAt,
    this.createdAt,
  });
}
