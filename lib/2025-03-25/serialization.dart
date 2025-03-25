import 'dart:convert';
import 'dart:io';

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  // 역직렬화
  User.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      email = json['email'];

  // 직렬화
  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email};
  }

  @override
  String toString() => 'User(name: $name, email: $email)';
}

void main() {
  const filePath =
      '/Users/jilong/Desktop/workspace/flutter_modu/lib/2025-03-25';

  /* 
    직렬화 
    객체 -> json
  */
  final User user = User(name: '이지롱', email: 'jilong@naver.com');
  // 1. 파일 열기
  final File userFile = File('$filePath/user_file.txt');
  // 2. 객체 -> map
  Map<String, dynamic> json = user.toJson();
  // 3. Map(Json)-> String
  String jsonString = jsonEncode(json);
  // 4. 파일로 내보내기
  userFile.writeAsStringSync(jsonString);

  /* 
    역직렬화 
    json -> 객체로
  */
  // 1. 파일에서 JSON 문자열 읽기
  String jsonFromFile = userFile.readAsStringSync();
  // 2. JSON 문자열 -> Map 변환
  Map<String, dynamic> jsonMap = jsonDecode(jsonFromFile);
  // 3. Map -> User 객체 생성
  User deserializedUser = User.fromJson(jsonMap);

  print(deserializedUser);
}
