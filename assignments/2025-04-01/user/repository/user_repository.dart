import '../../utils/json_repository.dart';
import '../data_source/impl/user_data_source_impl.dart';
import '../model/user.dart';

abstract interface class UserRepository
    extends JsonRepository<User, int, UserDataSourceImpl> {
  UserRepository(super.dataSource, super.entity);

  Future<List<User>> getItemsTop10ByUserName(String fileName);
}
