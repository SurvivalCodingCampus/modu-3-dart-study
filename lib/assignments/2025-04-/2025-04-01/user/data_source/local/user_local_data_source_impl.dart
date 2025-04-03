import '../../../base/base_data_source_impl.dart';
import '../user_data_source.dart';

class UserLocalDataSourceImpl extends BaseDataSourceImpl implements UserDataSource {
  @override
  Future<List<Map<String, dynamic>>> getUsers() async {
    final path = 'assignments/structure/2025-04-01/user/data/user.json';
    final resp = await getList(path);
    return resp;
  }
}