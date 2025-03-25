void main() {
  final now = DateTime.now();

  print(now.toString());
  print(now.toIso8601String());
  print(now.toUtc());
  print(now.toLocal());

  print(DateTime.parse('2024-03-24'));
}
