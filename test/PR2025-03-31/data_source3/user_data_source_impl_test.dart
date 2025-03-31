import 'package:modu_3_dart_study/PR2025-03-31/data_source3/user_data_source_impl.dart';
import 'package:test/test.dart';

void main() {
  final lastPhone = '024-648-3804';
  final lastName = 'Clementina DuBuque';
  final lastEmail = 'Rey.Padberg@karina.biz';
  final lastCity = 'Lebsackbury';
  final geoLat = -38.2386;
  final catchPhrase = 'Centralized empowering task-force';

  group('user.json 마지막 객체 확인', () {
    test('user.json 마지막 객체 확인', () async {
      final userData = UserDataSourceImpl();
      final users = await userData.getUsers();

      expect(users.last.phone, lastPhone);
      expect(users.last.name, lastName);
      expect(users.last.email, lastEmail);
      expect(users.last.company.catchPhrase, catchPhrase);
      expect(users.last.address.geo.lat, geoLat);
      expect(users.last.address.city, lastCity);
    });
  });
}
