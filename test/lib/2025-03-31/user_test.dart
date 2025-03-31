import 'package:modu_3_dart_study/2025-03-31/data_sources/user/user_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/data_sources/user/user_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/models/user.dart';
import 'package:test/test.dart';

void main() {
  const String path = '/lib/2025-03-31/data/users.json';
  final UserDataSource dataSource = UserDataSourceImpl();

  test('users.json을 데이터소스 구현체를 통해 역직렬화 해야한다.', () async {
    List<User> users = await dataSource.getUsers(path);
    expect(users, isA<List<User>>());
    expect(users.last.name, equals('Clementina DuBuque'));
  });
}
