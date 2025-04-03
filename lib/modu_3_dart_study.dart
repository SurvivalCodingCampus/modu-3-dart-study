import 'dart:io';

void main() {
  // print('Hello world: ${calculate()}!');
  // print(DateTime.now());
  // Map testMap = {};
  // List testList = [];
  // File file = File('assignments/2025-04-01/data_source/mock_todos.json');
  DateTime now = DateTime.now();
  print(now.toIso8601String());
  print(now.toUtc());
  print(now.toUtc().toIso8601String());
  print('${now.toUtc().toIso8601String().split('.').first}Z');
  print(
    DateTime(now.year, now.month, now.day, now.hour, now.minute, now.second),
  );
  print(
    DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
      now.minute,
      now.second,
    ).toString().split('.').first,
  );
}

int calculate() {
  return 6 * 7;
}
