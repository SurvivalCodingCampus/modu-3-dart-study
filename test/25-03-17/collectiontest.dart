import 'package:test/test.dart';

void main( ) {
  test('값이 들어있는가', () {
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

    expect(students[0]['name'], equals('홍길동'));
    expect(students[1]['age'], equals(22));

  });
}