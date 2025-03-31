import '../../model/user/user_model.dart';

abstract interface class UserListDataSource {
  Future<List<User>> fetchUserList();
}
