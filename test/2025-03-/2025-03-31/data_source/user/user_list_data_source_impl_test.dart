import 'package:test/test.dart';
import '../../../../../lib/assignments/2025-04-/2025-03-31/data_source/user/user_list_data_source.dart';
import '../../../../../lib/assignments/2025-04-/2025-03-31/data_source/user/user_list_data_source_impl.dart';

void main() {
  test('user list data 역직렬화 테스트', () async {
    final UserDataSource dataSource = UserDataSourceImpl();
    final userList = await dataSource.fetchUser();

    expect(userList.length, equals(10));
  });
}
