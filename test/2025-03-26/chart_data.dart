import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

void main() {
  File file = File('lib/2025-03-26/chart_data.json');

  String listData = file.readAsStringSync();

  Map<String, dynamic> decode = jsonDecode(listData);


  test('', (){



  });
}
