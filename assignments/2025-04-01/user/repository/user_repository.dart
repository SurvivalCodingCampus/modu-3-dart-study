import '../../utils/json_repository.dart';
import '../data_source/user_data_source.dart';
import '../model/user.dart';

abstract class UserRepository
    extends JsonRepository<User, int, UserDataSource> {
  UserRepository(super.dataSource, super.entity);

  Future<List<User>> getItemsTop10ByUserName(String fileName);
}
