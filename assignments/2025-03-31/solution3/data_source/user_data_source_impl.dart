import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/solution3/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/solution3/model/user.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<User>> getUsers() async {
    List<User> userList = [];
    String userJsonString =
        File(
          "lib/2025-03-31/solution3/data_source/users.json",
        ).readAsStringSync();

    List userListDecode = jsonDecode(userJsonString);

    for (Map<String, dynamic> item in userListDecode) {
      userList.add(User.fromJson(item));
    }

    return userList;
  }
}
