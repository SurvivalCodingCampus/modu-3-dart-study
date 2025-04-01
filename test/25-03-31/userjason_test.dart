import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../assignments/2025-03-31/practice_0331_03.dart';

void main() {
  group('UserData Test', () {
    test('Userdata 역직렬화', () async {
      final dataSource = UserData(
        '/Users/hemu/dev/DartProject/modu-3-dart-study/lib/data_source/userdata_source.json',
      );
      final user = await dataSource.getUsers();
      expect(user[0].id, 1);
      expect(user[0].address.geo.lat, isA<double>());
    });
  });
}
