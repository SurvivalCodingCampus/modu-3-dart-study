import 'dart:io';

import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-03-31/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/model/user.dart';

void main() {
  test('3. getUsers', () async {
    final file = File('lib/2025-03-31/data/get_users.json');
    final jsonUser = await file.readAsString();

    final userString = TodoDataSourceImpl(
      jsonString: '{}',
      jsonList: '[]',
      jsonUser: jsonUser,
    );

    final users = await userString.getUsers();

    expect(users, isA<List<User>>());
    expect(users.length, greaterThan(1));
    expect(users.first.name, equals('Leanne Graham'));
    expect(users[1].company.name, equals('Deckow-Crist'));
    expect(users[0].address.city, equals('Gwenborough'));
  });
}
