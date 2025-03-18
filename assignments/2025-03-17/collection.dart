import 'person.dart';

void main() {
  List<Map<String, dynamic>> students = [
    {
      'name': '홍길동',
      'age': 20
    },
    {
      'name': '한석봉',
      'age': 22
    },
  ];

  for (final student in students) {
    print('${student['name']}의 나이는 ${student['age']}살');
  }
}

