import 'dart:convert';

import 'package:test/test.dart';

import '../../../../assignments/2025-03-31/src/solution/address.dart';
import '../../../../assignments/2025-03-31/src/solution/company.dart';
import '../../../../assignments/2025-03-31/src/solution/geo.dart';
import '../../../../assignments/2025-03-31/src/solution/user.dart';
import '../../../../assignments/2025-03-31/src/solution/user_data_source_impl.dart';

void main() {
  final geo = Geo(lat: -37.3159, lng: 81.1496);
  final address = Address(
    street: 'Kulas Light',
    suite: 'Apt. 556',
    city: 'Gwenborough',
    zipCode: '92998-3874',
    geo: geo,
  );

  final company = Company(
    name: 'Romaguera-Crona',
    catchPhrase: 'Multi-layered client-server neural-net',
    bs: 'harness real-time e-markets',
  );

  final user = User(
    id: 1,
    name: 'Leanne Graham',
    userName: 'Bret',
    email: 'Sincere@april.biz',
    address: address,
    phone: '1-770-736-8031 x56442',
    webSite: 'hildegard.org',
    company: company,
  );
  group('Users', () {
    test('Geo 역질렬화', () {
      final jsonString = '''
        {
          "lat": "-37.3159",
          "lng": "81.1496"
        }
      ''';

      final json = jsonDecode(jsonString);

      final test = Geo.fromJson(json);

      expect(test, isA<Geo>());
      expect(test.lat, geo.lat);
      expect(test.lng, geo.lng);
    });

    test('Address 역질렬화', () {
      final jsonString = '''
        {
          "street": "Kulas Light",
          "suite": "Apt. 556",
          "city": "Gwenborough",
          "zipcode": "92998-3874",
          "geo": {
              "lat": "-37.3159",
              "lng": "81.1496"
          }
        }
      ''';

      final json = jsonDecode(jsonString);

      final test = Address.fromJson(json);

      expect(test, isA<Address>());
      expect(test.street, address.street);
      expect(test.suite, address.suite);
      expect(test.city, address.city);
      expect(test.zipCode, address.zipCode);
      expect(test.geo.lat, address.geo.lat);
      expect(test.geo.lng, address.geo.lng);
    });

    test('Company 역질렬화', () {
      final jsonString = '''
        {
          "name": "Romaguera-Crona",
          "catchPhrase": "Multi-layered client-server neural-net",
          "bs": "harness real-time e-markets"
        }
      ''';

      final company = Company(
        name: 'Romaguera-Crona',
        catchPhrase: 'Multi-layered client-server neural-net',
        bs: 'harness real-time e-markets',
      );

      final json = jsonDecode(jsonString);

      final test = Company.fromJson(json);

      expect(test, isA<Company>());
      expect(test.name, company.name);
      expect(test.catchPhrase, company.catchPhrase);
      expect(test.bs, company.bs);
    });

    test('User 역질렬화', () {
      final jsonString = '''
      {
        "id": 1,
        "name": "Leanne Graham",
        "username": "Bret",
        "email": "Sincere@april.biz",
        "address": {
            "street": "Kulas Light",
            "suite": "Apt. 556",
            "city": "Gwenborough",
            "zipcode": "92998-3874",
            "geo": {
                "lat": "-37.3159",
                "lng": "81.1496"
            }
        },
        "phone": "1-770-736-8031 x56442",
        "website": "hildegard.org",
        "company": {
            "name": "Romaguera-Crona",
            "catchPhrase": "Multi-layered client-server neural-net",
            "bs": "harness real-time e-markets"
        }
      }
      ''';

      final json = jsonDecode(jsonString);

      final test = User.fromJson(json);

      expect(test, isA<User>());
      expect(test.id, user.id);
      expect(test.name, user.name);
      expect(test.userName, user.userName);
      expect(test.email, user.email);
      //expect(test.address, user.address);
      expect(test.phone, user.phone);
      expect(test.webSite, user.webSite);
      //expect(test.company, user.company);
    });
  });

  test('UserDataSourceImpl().getUsers 테스트', () async {
    final result = await UserDataSourceImpl().getUsers();
    for (var e in result) {
      expect(e, isA<User>());
    }
  });
}
