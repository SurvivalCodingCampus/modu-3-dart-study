import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:test/test.dart';

import '../../assignment/2025-03-31/user.dart';
import '../../assignment/2025-03-31/user_data_source.dart';
import '../../assignment/2025-03-31/user_data_source_impl.dart';

void main() {
  final UserDataSource userDataSource = UserDataSourceImpl();

  group('User 테스트', () {
    test('Users 직렬화, 역직렬화가 정상적으로 이뤄져야 한다.', () async {
      final users = await userDataSource.getUsers();

      final json = users.map((e) => e.toJson()).toList();
      final jsonString = jsonEncode(json);
      final List<dynamic> deserializationJson = jsonDecode(jsonString);
      final List<User> deserializationTodos = deserializationJson.map((e) => User.fromJson(e)).toList();

      expect(ListEquality().equals(users, deserializationTodos), isTrue);
    });
  });
}
