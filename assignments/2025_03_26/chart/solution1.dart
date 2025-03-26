import 'chart_data.dart';
import 'json__string.dart';

void main() {
  final chartData = ChartData.fromJson(JsonString.jsonData);
  print(chartData);
}
