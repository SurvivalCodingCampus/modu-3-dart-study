void main() {
  for (var items in personList) {
    print("${items["name"]}의 나이는 ${items["age"]}살");
  }
}

List<Map<String, dynamic>> personList = [
  {"name": "홍길동", "age": 20},
  {"name": "한석봉", "age": 25},
];
