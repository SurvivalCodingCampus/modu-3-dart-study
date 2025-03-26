import 'dart:io';

import 'department.dart';
import 'employee.dart';

void main() {
  final currentDir =
      'C:\\Users\\Ujun\\modu-3-dart-study\\assignments\\2025_03_25\\json\\';
  final companyPath = 'company.txt';

  final companyFile = File('$currentDir$companyPath');

  final Employee gildong = Employee('홍길동', 41);
  final Department departmentGildong = Department('홍길동', gildong);

  print(gildong.toJson());
  print(departmentGildong.toJson());

  companyFile.writeAsStringSync(gildong.toJson().toString());
  companyFile.writeAsStringSync(
    departmentGildong.toJson().toString(),
    mode: FileMode.append,
  );
}
