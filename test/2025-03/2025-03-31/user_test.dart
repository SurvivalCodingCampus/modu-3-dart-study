import 'package:test/test.dart';

import '../../../assignments/2025-03/2025-03-31/address.dart';

import '../../../assignments/2025-03/2025-03-31/user.dart';
import '../../../assignments/2025-03/2025-03-31/user_data_source_impl.dart';

void main() {
  group('User 테스트', () {
    String path = 'assignments/2025-03-31/users.json';
    UserDataSourceImpl userDataSourceImpl = UserDataSourceImpl(path: path);
    test('getUsers 메소드 테스트', () async {
      List<User> userList = await userDataSourceImpl.getUsers();
      expect(userList[0].id == 1, isTrue);
      expect(userList[0].name == 'Leanne Graham', isTrue);
      expect(userList[0].address, isA<Address>());

      expect(
        userList[0].company.catchPhrase ==
            "Multi-layered client-server neural-net",
        isTrue,
      );
      expect(userList[0].company.bs == "harness real-time e-markets", isTrue);
      // print(userList);
    });
  });
}
