import '../../model/user/user_list_model.dart';
import '../../model/user/user_model.dart';
import '../base/base_data_source.dart';
import 'user_list_data_source.dart';

class UserListDataSourceImpl extends BaseDataSource
    implements UserListDataSource {
  @override
  String get path => 'assignments/2025-03-31/data/user_list.json';

  UserListDataSourceImpl();

  @override
  Future<List<User>> fetchUserList() async {
    final jsonData = fetchJson();
    final userList = UserList.fromJson(jsonData);
    await fetchDelay();
    return userList.list;
  }
}
