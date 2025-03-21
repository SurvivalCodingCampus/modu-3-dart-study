import 'package:collection/collection.dart';

void main() {
  List<String> names = ['홍길동', '김삿갓', '신사임당'];

  // names.sort((a, b) => b.compareTo(a));
  print(names);

  List<String> sortedName = names.sorted((a, b) => a.compareTo(b));
  print(sortedName);

  List<String> sortedByName = names.sortedBy((name) => name);
}
