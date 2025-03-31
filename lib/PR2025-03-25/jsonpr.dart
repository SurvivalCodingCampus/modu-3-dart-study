import 'dart:convert';
import 'dart:io';

class User {
  String name;
  int age;

  User(this.name, this.age);

  //직렬화 = 객체의 데이터를 json형식으로 바꾸줌
  Map<String, dynamic> toJson() => {"name": name, "age": age};

  //역직렬화 : json형식의 데이터를 객체형식으로 변환
  User.fromJson(Map<String, dynamic> json)
    : name = json["name"],
      age = json["age"];
}

void main() {
  //객체 선언
  User user = User('현수', 26);
  //객체를 직렬화 해주기
  final jsonString = jsonEncode(user.toJson());
  print(jsonString);
  //직렬화한 데이터를 txt파일 형식으로 저장
  File file = File('lib/PR2025-03-25/pratice.txt');
  file.writeAsStringSync(jsonString);
  //역직렬화
  Map<String, dynamic> json = jsonDecode(jsonString);
  print(json);
}
