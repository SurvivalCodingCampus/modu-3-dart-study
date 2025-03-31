import 'dart:convert';
import 'dart:io';

// class Geo {
//   double lat;
//   double lng;
//   Geo({required this.lat, required this.lng});

//   factory Geo.fromJson(Map<String, dynamic> jsonMap) {
//     return Geo(
//       lat: double.tryParse(jsonMap['lat']) ?? 0,
//       lng: double.tryParse(jsonMap['lng']) ?? 0,
//     );
//   }

//   @override
//   String toString() => 'Geo(lat: $lat, lng: $lng)';
// }

// class Address {
//   String street;
//   String suite;
//   String city;
//   String zipcode;
//   Geo geo;
//   Address({
//     required this.street,
//     required this.suite,
//     required this.city,
//     required this.zipcode,
//     required this.geo,
//   });

//   factory Address.fromJson(Map<String, dynamic> jsonMap) {
//     return Address(
//       street: jsonMap['street'] ?? '',
//       suite: jsonMap['suite'] ?? '',
//       city: jsonMap['city'] ?? '',
//       zipcode: jsonMap['zipcode'] ?? '',
//       geo: Geo.fromJson(jsonMap['geo']),
//     );
//   }
// }

// class Company {
//   String name;
//   String catchPhrase;
//   String bs;
//   Company({required this.name, required this.catchPhrase, required this.bs});
//   factory Company.fromJson(Map<String, dynamic> jsonMap) {
//     return Company(
//       name: jsonMap['name'] ?? '',
//       catchPhrase: jsonMap['catchPhrase'] ?? '',
//       bs: jsonMap['bs'] ?? '',
//     );
//   }
// }

// class User {
//   int id;
//   String name;
//   String username;
//   String email;
//   Address address;
//   String phone;
//   String website;
//   Company company;
//   User({
//     required this.id,
//     required this.name,
//     required this.username,
//     required this.email,
//     required this.address,
//     required this.phone,
//     required this.website,
//     required this.company,
//   });
//   factory User.fromJson(Map<String, dynamic> jsonMap) {
//     return User(
//       id: jsonMap['id'] ?? 0,
//       name: jsonMap['name'] ?? '',
//       username: jsonMap['username'] ?? '',
//       email: jsonMap['email'] ?? '',
//       address: Address.fromJson(jsonMap['address']),
//       phone: jsonMap['phone'] ?? '',
//       website: jsonMap['website'] ?? '',
//       company: Company.fromJson(jsonMap['company']),
//     );
//   }
// }

// abstract interface class UserDataSource {
//   Future<List<User>> getUsers();
// }

// class UserDataSourceImpl implements UserDataSource {
//   String path;
//   UserDataSourceImpl({required this.path});

//   @override
//   Future<List<User>> getUsers() async {
//     final List jsonMap = jsonDecode(await File(path).readAsString());
//     return jsonMap.map((e) => User.fromJson(e)).toList();
//   }
// }

class StockListing {
  String symbol;
  String name;
  String exchange;
  String assetType;
  DateTime? ipoDate;
  DateTime? delistingDate;
  String status;
  StockListing({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    this.ipoDate,
    this.delistingDate,
    required this.status,
  });

  factory StockListing.fromCsv(List<String> dataList) {
    return StockListing(
      symbol: dataList[0],
      name: dataList[1],
      exchange: dataList[2],
      assetType: dataList[3],
      ipoDate: DateTime.tryParse(dataList[4]),
      delistingDate: DateTime.tryParse(dataList[5]),
      status: dataList[6],
    );
  }
}

abstract interface class StockDataSource {
  Future<List<StockListing>> getStockListings();
}

class StockDataSourceImpl implements StockDataSource {
  final String path;

  StockDataSourceImpl({required this.path});

  @override
  Future<List<StockListing>> getStockListings() async {
    File csv = File(path);
    List<StockListing> stockListings = [];
    try {
      final lines = await csv.readAsLines();
      for (final line in lines.sublist(1)) {
        final dataList = line.split(',');
        stockListings.add(StockListing.fromCsv(dataList));
      }
      return stockListings;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}

void main() async {
  //4
//   File csv = File('assignments/2025-03-31/listing_status.csv');
//   final lines = await csv.readAsLines();
//   print(lines.sublist(0, 10));
//   print(lines[0].split(','));
//   print(lines[1].split(','));

  String path = 'assignments/2025-03-31/listing_status.csv';
  StockDataSourceImpl stockDataSourceImpl = StockDataSourceImpl(path: path);
  List<StockListing> list = await stockDataSourceImpl.getStockListings();
  print(list.sublist(0, 10));

  //3
  //   UserDataSourceImpl userDataSourceImpl = UserDataSourceImpl(
  //     path: 'assignments/2025-03-31/users.json',
  //   );

  //   final users = await userDataSourceImpl.getUsers();
  //   print(users);
  //   print(double.tryParse('h'));

  //1
  //   TodoDataSourceImpl todoDataSourceImpl = TodoDataSourceImpl(
  //     path: 'assignments/2025-03-31/todo.json',
  //   );
  //   Todo todo = await todoDataSourceImpl.getTodo();
  //   print(todo);

  //2
  //   File todosFile = File('assignments/2025-03-31/todos.json');
  //   final List todosList = jsonDecode(todosFile.readAsStringSync());
  //   final List<Todo> data = todosList.map((e) => Todo.fromJson(e)).toList();
  //   print(todosList.runtimeType);
  //   print(todosList[0].runtimeType);
  //   print(data);
  //   TodoDataSourceImpl todoDataSourceImpl = TodoDataSourceImpl(
  //     path: 'assignments/2025-03-31/todos.json',
  //   );
  //   List<Todo> todos = await todoDataSourceImpl.getTodos();
}
