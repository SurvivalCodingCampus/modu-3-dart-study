import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-26/soluation1/data_class.dart';
import 'package:test/scaffolding.dart';

void main() {
  test("테스트", () {
    final jsonData = jsonDecode(
      File("lib/2025-03-26/soluation1/chart_data.json").readAsStringSync(),
    );

    jsonData.forEach((key, value) {
      value.map((items) {
        ChartDataList(chatData: ChatData.fromJson(items));
        print("key $key");
      });
    });
  });
}
