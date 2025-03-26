import 'dart:convert';
import 'dart:io';
import 'package:test/test.dart';
import '../../assignments/2025-03-25/employee.dart';

void main() {
  group('Department Serialization Tests', () {
    const testFilePath = 'test/company_test.txt';

    setUp(() {
      // 테스트 시작 전 기존 파일 삭제 (청소)
      final file = File(testFilePath);
      if (file.existsSync()) {
        file.deleteSync();
      }
    });

    test('파일 저장 & 불러오기 테스트', () {
      final employee = Employee('홍길동', 41);
      final department = Department('총무부', employee);

      // 🔹 1. JSON 직렬화 & 파일 저장
      final String jsonString = jsonEncode({
        'name': department.name,
        'leader': department.leader.toJson()
      });

      final File file = File(testFilePath);
      file.writeAsStringSync(jsonString);

      // 🔹 2. 파일이 정상적으로 저장되었는지 확인
      expect(file.existsSync(), isTrue);

      // 🔹 3. 파일에서 JSON 불러와 역직렬화
      final String loadedJson = file.readAsStringSync();
      final Department loadedDepartment = Department.fromJson(jsonDecode(loadedJson));

      // 🔹 4. 데이터 검증
      expect(loadedDepartment.name, equals('총무부'));
      expect(loadedDepartment.leader.name, equals('홍길동'));
      expect(loadedDepartment.leader.age, equals(41));
    });

    test('파일이 없을 때 예외 발생 확인', () {
      final File file = File(testFilePath);

      expect(() => file.readAsStringSync(), throwsA(isA<FileSystemException>()));
    });
  });
}