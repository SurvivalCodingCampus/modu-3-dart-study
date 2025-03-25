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

  if (File(savePath).existsSync()) {
    print("$savePath 가 올바르지 않습니다");

    return;
  }
  file.writeAsStringSync(fileContent);
  print("파일 저장이 완료 되었습니다");
}

Map<String, dynamic> readFileJson({required String saveFilePath}) {
  File file = File(saveFilePath);
  String content = file.readAsStringSync();
  return jsonDecode(content);
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

  Department department2 = Department.fromJson(
    readFileJson(saveFilePath: "lib/2025-03-25/solution3/company.txt"),
  );

  print(department2.name);
  print(department2.leader);
}
