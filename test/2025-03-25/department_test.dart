import 'dart:convert';

import '../../assignment/2025-03-25/index.dart';
import 'package:test/test.dart';

void main() {
  group('Department 테스트', () {
    final defaultFileOperations = DefaultFileOperations();
    const targetPath =
        'assignment/2025-03-25/company.txt';

    test(
      'department를 인스턴스화하고 직렬화해서 company.txt에 저장해야 한다. 이후 제목과 내용, 객체가 같아야한다.',
      () {
        // 홍길동 인스턴스 선언
        final hongEmployee = Employee('홍길동', 41);
        final hongDepartment = Department('총무부', hongEmployee);
        // 홍길동 인스턴스 직렬화
        final jsonString = jsonEncode(hongDepartment.toJson());
        final fileName = targetPath.split('/').last;

        defaultFileOperations.write(targetPath, jsonString);

        // 저장된 파일 열기
        final savedFile = File(targetPath);
        // 파일 이름
        final savedFileName = savedFile.path.split('/').last;
        // 저장된 jsonString 역직렬화
        final savedJson = jsonDecode(savedFile.readAsStringSync());
        final parsedHongDepartment = Department.fromJson(savedJson);

        expect(savedFile.readAsStringSync(), equals(jsonString));
        expect(savedFileName, fileName);
        expect(hongDepartment == parsedHongDepartment, isTrue);
      },
    );

    tearDown(() {
      final file = File(targetPath);
      file.delete();
    });
  });
}
