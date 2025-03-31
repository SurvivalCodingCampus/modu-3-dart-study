import 'package:test/test.dart';

import '../../assignments/2025-03-31/data_source/impl/user_data_source_impl.dart';
import '../../assignments/2025-03-31/data_source/user_data_source.dart';
import '../../assignments/2025-03-31/model/user.dart';

void main() {
  const String fileName = 'users.json';
  const String wrongFileName = 'users2.json';
  final UserDataSource userDataSource = UserDataSourceImpl();

  group('사용자 : ', () {
    test('user.json 파일 받아오기', () async {
      List<User> users = await userDataSource.getUsersFromFile(fileName);

      expect(users, isA<List<User>>());
      expect(users.length, equals(10));
    });

    test('user.json 파일 받아오기 실패', () async {
      expect(
        () async => await userDataSource.getUsersFromFile(wrongFileName),
        throwsA(isArgumentError),
      );
    });
  });
}
