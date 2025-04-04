import 'package:modu_3_dart_study/2025-03-31/user.dart';
import 'package:modu_3_dart_study/2025-03-31/user_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/user_data_source_impl.dart';
import 'package:test/test.dart';

void main() {
  final UserDataSource dataSource = UserDataSourceImpl();

  test('3번 문제', () async {
    List<User> users = await dataSource.getUsers();

    expect(users.length, 10);
  });
}
