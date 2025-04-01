import '../../model/user/user_list_model.dart';
import '../../model/user/user_model.dart';
import '../base/base_data_source.dart';
import 'user_list_data_source.dart';

class UserDataSourceImpl extends BaseDataSource
    implements UserDataSource {
  @override
  String get basePath => 'assignments/2025-03-31/data/';

  UserDataSourceImpl();

  @override
  Future<List<User>> fetchUser() async {
    final jsonData = fetchJson('user_list.json');
    final userList = UserList.fromJson(jsonData);
    await fetchDelay();
    return userList.list;
  }
}
