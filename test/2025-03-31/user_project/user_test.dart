import 'package:modu_3_dart_study/2025-03-31/user_project/data_source/user_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/user_project/model/company.dart';
import 'package:modu_3_dart_study/2025-03-31/user_project/model/geo.dart';
import 'package:modu_3_dart_study/2025-03-31/user_project/model/user.dart';
import 'dart:convert';
import 'package:test/test.dart';

void main() {
  group('[ User 클래스 ] - ', () {
    test('Json을 User 객체로 변환 되어야 한다.', () {
      final Map<String, dynamic> json = {
        "id": 1,
        "name": "Leanne Graham",
        "username": "Bret",
        "email": "Sincere@april.biz",
        "address": {
          "street": "Kulas Light",
          "suite": "Apt. 556",
          "city": "Gwenborough",
          "zipcode": "92998-3874",
          "geo": {"lat": "-37.3159", "lng": "81.1496"}
        },
        "phone": "1-770-736-8031 x56442",
        "website": "hildegard.org",
        "company": {
          "name": "Romaguera-Crona",
          "catchPhrase": "Multi-layered client-server neural-net",
          "bs": "harness real-time e-markets"
        }
      };

      final user = User.fromJson(json);

      expect(user.id, 1);
      expect(user.name, "Leanne Graham");
      expect(user.username, "Bret");
      expect(user.email, "Sincere@april.biz");
      expect(user.address.street, "Kulas Light");
      expect(user.address.geo.lat, -37.3159);
      expect(user.address.geo.lng, 81.1496);
      expect(user.company.name, "Romaguera-Crona");
    });

    test('[Geo 클래스] lat과 lng 값 double로 변환되어야 한다.', () {
      final geoJson = {"lat": "37.3159", "lng": "81.1496"};
      final geo = Geo.fromJson(geoJson);

      expect(geo.lat, isA<double>());
      expect(geo.lng, isA<double>());
      expect(geo.lat, 37.3159);
      expect(geo.lng, 81.1496);
    });

  });
}

/*
void main() async {

  final String filePath = 'C:/dev/DartProjects/modu-3-dart-study/test/2025-03-31/user_project/';
  final UserDataSourceImpl dataSource = UserDataSourceImpl(filePath + 'users.json');
  final users = await dataSource.getUsers();

  // 일단 체크
  for (User user in users) {
    print(user.toString());
  }
}
*/