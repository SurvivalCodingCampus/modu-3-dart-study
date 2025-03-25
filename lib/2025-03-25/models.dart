
import 'dart:convert';
import 'dart:io';

import 'default_file_operations.dart';

class Employee {
  final String name;
  final int age;

  Employee({required this.name, required this.age});

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }

  Employee.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'];
}

class Department {
  String name;
  Employee leader;

  Department({required this.name, required this.leader});

  Map<String, dynamic> toJson() {
    return {'name': name, 'leader': leader.toJson()};
  }

  Department.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        leader = Employee.fromJson(json['leader']);

  // 직렬화 파일 저장 함수
  void serializeToFile(String filename) {
    final file = File(filename);


    // 대상 경로 검사
    final targetDirectory = Directory(filename).parent;
    if (!targetDirectory.existsSync()) {
      DefaultFileOperations.error('저장 경로가 존재하지 않음', reason: filename);
    }

    try {
      String jsonString = jsonEncode(toJson());
      file.writeAsStringSync(jsonString);
    } catch (e) {
      print(e);
    }
  }

// 역직렬화 함수
  static Department deserializeFromFile(String filename) {

    final file = File(filename);

    // 파일이 존재하는지 확인
    if (!file.existsSync()) {
      DefaultFileOperations.error('json을 불러올 경로에 파일이 존재하지 않음', reason: filename);
    }

    // 대상 경로 검사
    final targetDirectory = Directory(filename).parent;
    if (!targetDirectory.existsSync()) {
      DefaultFileOperations.error('json을 불러올 경로가 존재하지 않음', reason: filename);
    }

    String jsonString = file.readAsStringSync();

    // 읽어온 값이 비어있다면
    // if (jsonString.isEmpty) {
    //   throw Exception('json string을 읽을 수 없습니다.');
    // }

    // JSON 문자열을 Department 객체로 변환
    Map<String, dynamic> jsonMap;

    try {
      jsonMap = jsonDecode(jsonString);
    } catch (e) {
      if (e is FormatException) {
        print('유효한 json 형식의 String이 아닙니다. json : $jsonString');
      }else {
        print('Unknown error: $e, json: $jsonString');
      }

      // throw Exception('잘못된 json String으로 불러올 수 없습니다.');
      return Department(name: 'Unknown', leader: Employee(name:'Unknown', age: 0));
    }
    return Department.fromJson(jsonMap);
  }
}
