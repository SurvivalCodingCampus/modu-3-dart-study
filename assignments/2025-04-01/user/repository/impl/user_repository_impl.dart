import 'package:collection/collection.dart';

import '../../../utils/json_repository.dart';
import '../../data_source/impl/user_data_source_impl.dart';
import '../../model/user.dart';
import '../user_repository.dart';

class UserRepositoryImpl extends JsonRepository<User, int, UserDataSourceImpl>
    implements UserRepository {
  UserRepositoryImpl(super.dataSource, super.entity);

  @override
  Future<List<User>> getItemsTop10ByUserName(String fileName) async {
    return (await getItems(
      fileName,
    )).sorted((a, b) => a.name.compareTo(b.name)).take(10).toList();
  }
}
