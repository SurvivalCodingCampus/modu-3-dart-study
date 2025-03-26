import 'dart:convert';
import 'dart:io';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import '../../assignments/2025-03-25/department.dart';
import '../../assignments/2025-03-25/employee.dart';

void main() {
  final leaderName = '홍길동';
  final leaderAge = 41;
  final leaderJson = {"name": leaderName, "age": leaderAge};
  final leaderJsonString = '''{"name":"홍길동","age":41}''';

  final departmentName = '총무부';
  final departmentJson = {"name": departmentName, "leader": {"name": leaderName, "age": leaderAge}};
  final departmentJsonString = '''{"name":"총무부","leader":{"name":"홍길동","age":41}}''';
  final filePath = '/Users/yunsuk990/Desktop/modu/Modu_Flutter/assignments/2025-03-25/company.txt';

  group('여러가지 데이터 형식', (){

    test('Employee 생성', (){
        Employee leader = Employee(leaderName, leaderAge);

        expect(leader.name, equals(leaderName));
        expect(leader.age, equals(leaderAge));
        expect(leader, isA<Employee>());
    });

    test('Department 생성', (){
      Employee leader = Employee(leaderName, leaderAge);
      Department department = Department(departmentName, leader);

      expect(leader.name, equals(leaderName));
      expect(leader.age, equals(leaderAge));
      expect(leader, isA<Employee>());
      expect(department.name, equals(departmentName));
      expect(department.leader, equals(leader));
      expect(department, isA<Department>());
    });

    test('Employee 직렬화', (){
      Employee leader = Employee(leaderName, leaderAge);

      Map<String, dynamic> json = leader.toJson();
      String jsonString = jsonEncode(json);
      print(json);
      print(jsonString);

      expect(json, equals(leaderJson));
      expect(jsonString, equals(leaderJsonString));
    });

    test('Department 직렬화', (){
      Employee leader = Employee(leaderName, leaderAge);
      Department department = Department(departmentName, leader);


      Map<String, dynamic> json = department.toJson();
      String jsonString = jsonEncode(json);
      print(json);
      print(jsonString);

      expect(json, equals(departmentJson));
      expect(jsonString, equals(departmentJsonString));
    });

    test('Employee 역직렬화', (){
      Map<String, dynamic> json = jsonDecode(leaderJsonString);

      Employee leader = Employee.fromJson(json);

      expect(leader.name, equals(leaderName));
      expect(leader.age, equals(leaderAge));
      expect(leader, isA<Employee>());
    });

    test('Department 역직렬화', (){
      Map<String, dynamic> department_json = jsonDecode(departmentJsonString);

      Department department = Department.fromJson(department_json);

      expect(department, isA<Department>());
      expect(department.name, equals(departmentName));
      expect(department.leader, isA<Employee>());
      expect(department.leader.name, equals(leaderName));
      expect(department.leader.age, equals(leaderAge));
    });

    test('company.txt 파일 저장', (){
      Employee leader = Employee(leaderName, leaderAge);
      Department department = Department(departmentName, leader);

      Map<String, dynamic> json = department.toJson();
      String jsonString = jsonEncode(json);

      //파일 쓰기
      File file = department.writeFile(filePath, jsonString);


      expect(file.readAsStringSync(), equals(departmentJsonString));
      expect(file.path, equals(filePath));
    });
  });
}