import 'dart:convert';

import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import '../../../lib/assignments/2025-03-/2025-03-25/default_file_operations.dart';
import '../../../lib/assignments/2025-03-/2025-03-25/department.dart';
import '../../../lib/assignments/2025-03-/2025-03-25/employee.dart';

void main() {
  group('파일 글 작성 테스트', () {
    final employee = Employee('홍길동', 41);
    final department = Department('총무부', employee);
    final fileOperation = DefaultFileOperations();
    final sourceDirPath =
        '/Users/myung/flutter_app/modu_3/modu-3-dart-study/test/2025-03-24/';
    final sourcePath = sourceDirPath + 'test.txt';

    final jsonData = department.toJson();

    test("직렬화 후 파일에 작성 test", () {
      expect(
        () =>
            fileOperation.writeToFile(sourcePath, '${jsonEncode(jsonData)}\n'),
        returnsNormally,
      );
    });

    test("역직렬화 후 파일에 작성 test", () {
      expect(
        () => fileOperation.writeToFile(
          sourcePath,
          '${Department.fromJson(jsonData).toString()}\n',
        ),
        returnsNormally,
      );
    });

    test("직렬화 후 파일에 작성 에러 test", () {
      expect(
        () => fileOperation.writeToFile(
          sourceDirPath,
          jsonEncode(department.toJson()),
        ),
        throwsA(isA<Exception>()),
      );
    });
  });
}
