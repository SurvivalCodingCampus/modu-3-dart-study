import 'package:modu_3_dart_study/2025-03-31/solution3/model/user.dart';

abstract interface class UserDataSource {
  Future<List<User>> getUsers();
}
