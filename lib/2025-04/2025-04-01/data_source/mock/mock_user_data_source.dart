import 'package:modu_3_dart_study/2025-04/2025-04-01/model/geolocation.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-01/model/address.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-01/model/company.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-01/model/user.dart';
import 'package:modu_3_dart_study/2025-04/data_source.dart';

class MockUserDataSource implements DataSource<User> {
  @override
  Future<List<User>> load({String? relativePath}) async {
    return [
      User(
        id: 1,
        name: 'Dart',
        email: 'example@example.net',
        username: 'dart',
        phone: '123-456-7890',
        website: 'example.com',
        company: Company(bs: 'A', catchPhrase: 'B', name: 'Company'),
        address: Address(
          city: 'A',
          suite: 'B',
          zipcode: 'C',
          street: 'D',
          geolocation: Geolocation(longitude: 1.0, latitude: 2.0),
        ),
      ),
      User(
        id: 2,
        name: 'Flutter',
        email: 'example@example.net',
        username: 'dart',
        phone: '123-456-7890',
        website: 'example.com',
        company: Company(bs: 'A', catchPhrase: 'B', name: 'Company'),
        address: Address(
          city: 'A',
          suite: 'B',
          zipcode: 'C',
          street: 'D',
          geolocation: Geolocation(longitude: 1.0, latitude: 2.0),
        ),
      ),
      User(
        id: 3,
        name: 'Flutter',
        email: 'example@example.net',
        username: 'A',
        phone: '123-456-7890',
        website: 'example.com',
        company: Company(bs: 'A', catchPhrase: 'B', name: 'Company'),
        address: Address(
          city: 'A',
          suite: 'B',
          zipcode: 'C',
          street: 'D',
          geolocation: Geolocation(longitude: 1.0, latitude: 2.0),
        ),
      ),
    ];
  }
}
