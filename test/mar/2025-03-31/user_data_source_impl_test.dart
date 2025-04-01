import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../playground/mar/2025-03-31/user/data_source/user_data_source_impl.dart';
import '../../../playground/mar/2025-03-31/user/model/user.dart';

void main() {
  test('userData', () async {
    final dataSource = UserDataSourceImpl();
    final users = await dataSource.getListUser();

    expect(users, equals(isA<List<User>>()));
    expect(users.length, equals(10));
  });
}
