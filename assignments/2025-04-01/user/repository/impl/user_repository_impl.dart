import 'package:collection/collection.dart';

import '../../model/user.dart';
import '../user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(super.dataSource, super.entity);

  @override
  Future<List<User>> getItemsTop10ByUserName(String fileName) async {
    return (await getItems(
      fileName,
    )).sorted((a, b) => a.name.compareTo(b.name)).take(10).toList();
  }
}
