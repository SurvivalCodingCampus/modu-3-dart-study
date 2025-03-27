import 'dart:convert';
import 'dart:io';

class Employee {
  String name;
  int age;

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }

  Employee.fromJson(Map<String, dynamic> json)
    : name = json["name"],
      age = json["age"];

  Employee({required this.name, required this.age});
}

class Department {
  String name;
  Employee leader;

  Map<String, dynamic> toJson() {
    return {"department_name": name, "department_leader": leader.toJson()};
  }

  Department({required this.name, required this.leader});

  Department.fromJson(Map<String, dynamic> json)
    : name = json["department_name"],
      leader = Employee.fromJson(json["department_leader"]);
}

//파일 저장 함수
void infoWriteFile({
  required String fileName,
  required String savePath,
  required String fileContent,
}) {
  final file = File("$savePath/$fileName.txt");

  if (!Directory(savePath).existsSync()) {
    print("$savePath 가 올바르지 않습니다");

    return;
  }
  file.writeAsStringSync(fileContent);
  print("파일 저장이 완료 되었습니다");
}

Map<String, dynamic> readFileJson({required String saveFilePath}) {
  try {
    File file = File(saveFilePath);
    if (!file.existsSync()) {
      print("파일이 존재하지 않습니다: $saveFilePath");
      return {};
    }
    String content = file.readAsStringSync();
    return jsonDecode(content);
  } catch (e) {
    print("파일 읽기 오류: $e");
    return {};
    // TODO
  }
}

void main() {
  //직원 생성
  Employee employee = Employee(name: "홍길동", age: 41);

  //부서 생성
  Department department = Department(name: "총무부", leader: employee);

  //Json으로 직렬화
  Map<String, dynamic> departMentInfo = department.toJson();

  //직렬화된 Json을 String으로 인코딩
  String departMentInfoString = jsonEncode(departMentInfo);

  infoWriteFile(
    fileName: "company",
    savePath: "lib/2025-03-25/solution3",
    fileContent: departMentInfoString,
  );

  try {
    Map<String, dynamic> jsonData = readFileJson(
      saveFilePath: "lib/2025-03-25/solution3/company.txt",
    );
    if (jsonData.isEmpty) {
      print("파일을 읽을 수 없거나 내용이 없습니다.");
      return;
    }
    Department department2 = Department.fromJson(jsonData);
    print(department2.name);
    print(department2.leader);
  } catch (e) {
    print("부서 정보 생성 오류: $e");
  }
}
