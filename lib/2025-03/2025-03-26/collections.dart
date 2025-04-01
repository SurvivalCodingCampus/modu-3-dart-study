import 'package:modu_3_dart_study/2025-03/2025-03-26/collection.dart';

class Collections {
  List<Collection> inner = [];

  Collections.fromJson(Map<String, dynamic> json) {
    for (final i in json['collectionChartDataList']) {
      inner.add(Collection.fromJson(i));
    }
  }

  @override
  String toString() {
    return 'Collections{inner: $inner}';
  }
}
