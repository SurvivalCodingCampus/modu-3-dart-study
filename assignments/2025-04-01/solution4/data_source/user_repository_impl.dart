import 'package:modu_3_dart_study/2025-04-01/solution4/data_source/user_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/solution4/model/user.dart';

class UserRepositoryImpl implements UserRepository {
  final List<Map<String, dynamic>> userData;

  @override
  Future<List<User>> getUsers() async {
    List<User> userList = [];
    for (Map<String, dynamic> items in userData) {
      userList.add(User.fromMap(items));
    }
    return userList;
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    List<User> userList = [];
    userData.sort((a, b) => a["name"].compare(b));
    for (int i = 0; i < 10; i++) {
      userList.add(User.fromMap(userData[i]));
    }
    return userList;
  }

  const UserRepositoryImpl({required this.userData});
}
