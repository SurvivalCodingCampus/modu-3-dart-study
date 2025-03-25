import 'dart:convert';
import 'dart:io';

void main() {
  const filePath = 'lib/2025-03-25/my_file.txt';
  final File myFile = File(filePath);

  // 열기 & 내용 쓰기 & 닫기
  myFile.writeAsStringSync('Hello\n', mode: FileMode.append);

  // 파일에서 읽기
  final text = myFile.readAsStringSync();
  print(text);

  final Wizard wizard = Wizard('마법사', 1, 2);

  // 객체 -> Map(Json)
  final Map<String, dynamic> json = wizard.toJson();

  //Map(Json) -> String
  String jsonString = jsonEncode(json);
}


class Wizard {
  String name;
  int hp;
  int mp;

  Wizard(this.name, this.hp, this.mp);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'hp': hp,
      'mp': mp
    };
  }

  Wizard.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        hp = json['hp'],
        mp = json['mp'];
}