import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class Store with _$Store {
  final String address;
  final String name;
  final String remainStatus;
  final double latitude;
  final double longitude;

  const Store({
    required this.address,
    required this.name,
    required this.remainStatus,
    required this.latitude,
    required this.longitude,
  });
}