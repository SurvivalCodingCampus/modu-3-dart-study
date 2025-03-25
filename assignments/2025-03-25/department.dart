import 'dart:io';
import 'employee.dart';

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

  Department.fromJson(Map<String, dynamic> json): name = json['name'], leader = Employee.fromJson(json['leader']);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'leader': leader.toJson(),
    };
  }

  File writeFile(String path, String content){
    File file = File(path);
    file.writeAsStringSync(content);
    return file;
  }
}