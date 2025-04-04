import 'package:collection/collection.dart';
import 'package:test/test.dart';

import '../../lib/2025-04-01/model/user.dart';

void main() {
  const List<Map<String, dynamic>> mockUsers = [
    {
      "id": 1,
      "name": "Leanne Graham",
      "username": "Bret",
      "email": "Sincere@april.biz",
      "address": {
        "street": "Kulas Light",
        "suite": "Apt. 556",
        "city": "Gwenborough",
        "zipcode": "92998-3874",
        "geo": {"lat": "-37.3159", "lng": "81.1496"},
      },
      "phone": "1-770-736-8031 x56442",
      "website": "hildegard.org",
      "company": {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered client-server neural-net",
        "bs": "harness real-time e-markets",
      },
    },
  ];

  group('Users 테스트', () {
    test('직렬화, 역직렬화 테스트', () {
      final users = mockUsers.map((e) => User.fromJson(e)).toList();
      final jsonList = users.map((e) => e.toJson()).toList();
      final deserializationUsers =
          jsonList.map((e) => User.fromJson(e)).toList();

      expect(
        users[0].name.isNotEmpty,
        equals(deserializationUsers[0].name.isNotEmpty),
      );
    });
  });
}
