import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/data_source/user_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/model/user.dart';
import 'package:modu_3_dart_study/modu_3_dart_study.dart';
import 'package:test/test.dart';

void main() {
  test('과제3 User 테스트', () async {
    final File file = File('lib/2025-03-31/users.json');
    final String fileString = file.readAsStringSync();
    final List<dynamic> jsonList  = jsonDecode(fileString); // 다이나믹으로 밖에 안받아짐.

    final List<User> users = await UserDataSourceImpl().getUsers();

    expect(users, isA<List<User>>());
    expect(users.length, 10);
  });
}
