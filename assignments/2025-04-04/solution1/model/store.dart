import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@Freezed(
  copyWith: true,
  equal: true,
  toStringOverride: true,
  toJson: true,
  fromJson: true,
)
abstract class Store with _$Store {
  const factory Store({
    required String code,
    required String addr,
    required Map<String, double> location,
    required String name,
    required DateTime stockAt,
    required DateTime createdAt,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) {
    return _$StoreFromJson({
      ...json,
      'location': {
        'lat': (json["lat"] as num).toDouble(),
        'lng': (json["lng"] as num).toDouble(),
      },
      'stockAt': DateFormat('yyyy-MM-dd HH:mm:ss').parse(json["stock_at"]),
      'createdAt': DateFormat('yyyy-MM-dd HH:mm:ss').parse(json["created_at"]),
    });
  }
}
