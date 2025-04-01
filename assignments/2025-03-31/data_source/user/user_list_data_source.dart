import '../../model/user/user_model.dart';

abstract interface class UserDataSource {
  Future<List<User>> fetchUser();
}
