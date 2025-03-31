import 'user/data_source/user_data_source_impl.dart';

void main() {
  final userData = UserDataSourceImpl().getUsers();

  print(userData);
}
