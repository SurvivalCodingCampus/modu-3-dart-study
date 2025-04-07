import 'package:modu_3_dart_study/PR2025-04-01/users/model/user.dart';
import 'package:modu_3_dart_study/PR2025-04-01/users/repository/user_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  test('', () async {
    UserRepositoryImpl userRepositoryImpl = UserRepositoryImpl();
    List<User> users = await userRepositoryImpl.getUsersTop10ByUserName();
    expect(users[0].username, startsWith('Antonette'));
    print(users);
  });
}
