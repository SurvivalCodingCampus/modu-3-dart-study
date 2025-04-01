import 'package:test/test.dart';

import '../../assignments/2025-04-01/user/data_source/impl/user_data_source_impl.dart';
import '../../assignments/2025-04-01/user/model/user.dart';
import '../../assignments/2025-04-01/user/repository/impl/user_repository_impl.dart';
import '../../assignments/2025-04-01/user/repository/user_repository.dart';

void main() {
  final UserRepository userRepository = UserRepositoryImpl(
    UserDataSourceImpl(),
    User(),
  );

  group('사용자 : ', () {
    test('전체 가져오기', () async {
      print(await userRepository.getItems('users.json'));
    });
    test('이름순 10명', () async {
      print(await userRepository.getItemsTop10ByUserName('users.json'));
    });
  });
}
