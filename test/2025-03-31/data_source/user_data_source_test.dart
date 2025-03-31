import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-03-31/data_source/user_data_source.dart';

void main() {
  const userId = 1;
  const userName = 'Leanne Graham';
  const userCity = 'Gwenborough';
  const userCompany = 'Romaguera-Crona';

  group('UserDataSourceImpl - 과제 3', () {
    final dataSource = UserDataSourceImpl();

    test('getUsers()는 올바른 필드와 geo 값을 가진 User 객체 리스트를 반환해야 한다', () async {
      final users = await dataSource.getUsers();

      // Users 리스트가 비지 않는지 확인
      expect(users, isNotEmpty);
      expect(users.length, greaterThan(0));

      // 첫 번째 사용자 정보 확인
      final user = users.first;

      // User 객체의 필드들 확인
      expect(user.id, userId);
      expect(user.name, userName);

      // Address 객체의 city 필드가 올바르게 역직렬화 되었는지 확인
      expect(user.address?.city, userCity);

      // Company 객체의 name 필드가 올바르게 역직렬화 되었는지 확인
      expect(user.company?.name, userCompany);

      // Geo 객체의 lat, lng 필드가 double 타입으로 잘 처리되었는지 확인
      final geo = user.address?.geo;
      expect(geo?.lat, isNotNull);
      expect(geo?.lng, isNotNull);
      expect(geo?.lat, isA<double>());
      expect(geo?.lng, isA<double>());
    });

    test('getUsers()는 User 객체를 JSON으로 직렬화 할 수 있어야 한다', () async {
      final users = await dataSource.getUsers();
      final user = users.first;

      // User 객체를 JSON으로 변환한 후, 올바르게 변환되었는지 확인
      final userJson = user.toJson();
      expect(userJson['id'], user.id);
      expect(userJson['name'], user.name);

      // Address 객체가 JSON으로 직렬화 되었는지 확인
      final addressJson = userJson['address'];
      expect(addressJson['city'], user.address?.city);

      // Geo 객체가 JSON으로 직렬화 되었는지 확인
      final geoJson = addressJson['geo'];
      expect(geoJson['lat'], user.address?.geo?.lat);
      expect(geoJson['lng'], user.address?.geo?.lng);
    });
  });
}
