import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/solution3/data_source/user_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/solution3/model/user.dart';
import 'package:test/test.dart';

void main() async {
  test('3.UserList', () async {
    String userJsonString =
        File(
          "lib/2025-03-31/solution3/data_source/users.json",
        ).readAsStringSync();

    List userListDecode = jsonDecode(userJsonString);

    UserDataSourceImpl userdatasourceimple = UserDataSourceImpl();
    List<User> getUserList = await userdatasourceimple.getUsers();

    for (int i = 0; i < getUserList.length; i++) {
      expect(getUserList[i].userId, userListDecode[i]["userId"]);
      expect(getUserList[i].completed, userListDecode[i]["completed"]);
      expect(getUserList[i].title, userListDecode[i]["title"]);
    }
  });
}
