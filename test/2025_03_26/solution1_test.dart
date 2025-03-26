import 'package:test/test.dart';

import '../../assignments/2025_03_26/chart/chart_data.dart';
import '../../assignments/2025_03_26/chart/json__string.dart';

void main() {
  final jsonData = JsonString.jsonData;
  final chartData = ChartData.fromJson(jsonData);
  group('fromJson Data 처리', () {
    test('', () {
      print(chartData);
    });
    test('toJson Data 처리', () {
      chartData.toJson();
      print(chartData);
    });
  });
}
