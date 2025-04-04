import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@freezed
abstract class Store with _$Store {
  const factory Store({
    required String address,
    required String code,
    required DateTime createdAt,
    required double lat,
    required double lng,
    required String name,
    required String remainStat,
    required DateTime stockAt,
    required String type,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
