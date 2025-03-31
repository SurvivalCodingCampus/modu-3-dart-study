import 'user/data_source/user_data_source_impl.dart';

void main() async {
  final userData = await UserDataSourceImpl().getUsers();

  print(userData);
}
