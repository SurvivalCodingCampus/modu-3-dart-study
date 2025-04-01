import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-03-31/data_source/user_data_source.dart';

void main() {
  const userId = 1;
  const userName = 'Leanne Graham';
  const userUsername = 'Bret';
  const userEmail = 'Sincere@april.biz';
  const userPhone = '1-770-736-8031 x56442';
  const userWebsite = 'hildegard.org';
  const userCity = 'Gwenborough';
  const userSuite = 'Apt. 556';
  const userZipcode = '92998-3874';
  const userCompany = 'Romaguera-Crona';
  const userCatchPhrase = 'Multi-layered client-server neural-net';
  const userBs = 'harness real-time e-markets';

  group('UserDataSourceImpl - 과제 3', () {
    final dataSource = UserDataSourceImpl();

    test('getUsers()는 모든 필드를 포함한 User 객체 리스트를 반환해야 한다', () async {
      final users = await dataSource.getUsers();

      expect(users, isNotEmpty);
      final user = users.first;

      expect(user.id, userId);
      expect(user.name, userName);
      expect(user.username, userUsername);
      expect(user.email, userEmail);
      expect(user.phone, userPhone);
      expect(user.website, userWebsite);

      expect(user.address?.city, userCity);
      expect(user.address?.suite, userSuite);
      expect(user.address?.zipcode, userZipcode);

      expect(user.company?.name, userCompany);
      expect(user.company?.catchPhrase, userCatchPhrase);
      expect(user.company?.bs, userBs);

      final geo = user.address?.geo;
      expect(geo?.lat, isNotNull);
      expect(geo?.lng, isNotNull);
      expect(geo?.lat, isA<double>());
      expect(geo?.lng, isA<double>());
    });

    test('getUsers()는 User 객체를 JSON으로 직렬화 할 수 있어야 한다', () async {
      final users = await dataSource.getUsers();
      final user = users.first;
      final userJson = user.toJson();

      expect(userJson['id'], user.id);
      expect(userJson['name'], user.name);
      expect(userJson['username'], user.username);
      expect(userJson['email'], user.email);
      expect(userJson['phone'], user.phone);
      expect(userJson['website'], user.website);

      final addressJson = userJson['address'];
      expect(addressJson['city'], user.address?.city);
      expect(addressJson['suite'], user.address?.suite);
      expect(addressJson['zipcode'], user.address?.zipcode);

      final geoJson = addressJson['geo'];
      expect(geoJson['lat'], user.address?.geo?.lat);
      expect(geoJson['lng'], user.address?.geo?.lng);

      final companyJson = userJson['company'];
      expect(companyJson['name'], user.company?.name);
      expect(companyJson['catchPhrase'], user.company?.catchPhrase);
      expect(companyJson['bs'], user.company?.bs);
    });
  });
}