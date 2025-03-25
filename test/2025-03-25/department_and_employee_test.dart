import 'package:modu_3_dart_study/2025-03-25/models.dart';
import 'package:test/test.dart';

void main() {
  final testPath = 'test/2025-03-25/test_file/';

  group('과제 내용 테스트', () {
    final filePath = '${testPath}company.txt';

    test('직렬화 파일 저장', () {
      // 총무부 리더 홍길동 인스턴스 생성
      Employee leader = Employee(name: '홍길동', age: 41);
      Department department = Department(name: '총무부', leader: leader);

      // 직렬화 및 파일에 저장
      department.serializeToFile(filePath);
    });
    test('역직렬화 파일 저장', () {
      // 역직렬화 후 데이터 출력
      Department loadedDepartment = Department.deserializeFromFile(filePath);

      // expect를 사용하여 결과 검증
      expect(loadedDepartment.name, '총무부');
      expect(loadedDepartment.leader.name, '홍길동');
      expect(loadedDepartment.leader.age, 41);
    });
  });

  group('다수 생성 테스트', () {
    final file1Path = '${testPath}com1.txt';
    final file2Path = '${testPath}com2.txt';

    test('여러개 Departments 직렬화 테스트', () {
      // 여러 부서 생성
      Employee leader1 = Employee(name: '김유진', age: 32);
      Department department1 = Department(name: '인사부', leader: leader1);

      Employee leader2 = Employee(name: '박철수', age: 45);
      Department department2 = Department(name: '마케팅부', leader: leader2);


      print(file1Path);
      print(file2Path);

      // 직렬화 후 파일 저장
      department1.serializeToFile(file1Path);
      department2.serializeToFile(file2Path);
    });

    test('여러개 Departments 역직렬화 테스트', () {
      // 역직렬화 후 출력
      Department loadedDepartment1 = Department.deserializeFromFile(file1Path);
      Department loadedDepartment2 = Department.deserializeFromFile(file2Path);

      // expect를 사용하여 결과 검증
      expect(loadedDepartment1.name, '인사부');
      expect(loadedDepartment1.leader.name, '김유진');
      expect(loadedDepartment1.leader.age, 32);

      expect(loadedDepartment2.name, '마케팅부');
      expect(loadedDepartment2.leader.name, '박철수');
      expect(loadedDepartment2.leader.age, 45);
    });
  });
}
