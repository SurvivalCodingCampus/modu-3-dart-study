import '../user_data_source.dart';

class MockUserDataSource implements UserDataSource {
  @override
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    return [
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
          "geo": {"lat": "-37.3159", "lng": "81.1496"}
        },
        "phone": "1-770-736-8031 x56442",
        "website": "hildegard.org",
        "company": {
          "name": "Romaguera-Crona",
          "catchPhrase": "Multi-layered client-server neural-net",
          "bs": "harness real-time e-markets"
        }
      },
      {
        "id": 2,
        "name": "John Doe",
        "username": "Zebra",
        "email": "john@doe.com",
        "address": {
          "street": "Sunset Blvd",
          "suite": "Apt. 101",
          "city": "Los Angeles",
          "zipcode": "12345",
          "geo": {"lat": "34.0522", "lng": "-118.2437"}
        },
        "phone": "123-456-7890",
        "website": "johndoe.com",
        "company": {
          "name": "Tech Innovations",
          "catchPhrase": "Innovating the Future",
          "bs": "Revolutionizing tech"
        }
      }
    ];
  }
}
