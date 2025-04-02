import 'package:test/test.dart';

import '../../assignments/2025-04-01/user/model/user.dart';
import '../../assignments/2025-04-01/user/repository/impl/user_repository_impl.dart';
import '../../assignments/2025-04-01/user/repository/user_repository.dart';
import 'mock/mock_user_data_source.dart';

void main() {
  late MockUserDataSource userDataSource;
  late UserRepository userRepository;
  late User user;

  group('사용자 : ', () {
    setUpAll(() {
      userDataSource = MockUserDataSource();
      user = User();
      userRepository = UserRepositoryImpl(userDataSource, user);

      userDataSource.setMockData('users.json', [
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
            "geo": {"lat": "-37.3159", "lng": "81.1496"},
          },
          "phone": "1-770-736-8031 x56442",
          "website": "hildegard.org",
          "company": {
            "name": "Romaguera-Crona",
            "catchPhrase": "Multi-layered client-server neural-net",
            "bs": "harness real-time e-markets",
          },
        },
        {
          "id": 2,
          "name": "Ervin Howell",
          "username": "Antonette",
          "email": "Shanna@melissa.tv",
          "address": {
            "street": "Victor Plains",
            "suite": "Suite 879",
            "city": "Wisokyburgh",
            "zipcode": "90566-7771",
            "geo": {"lat": "-43.9509", "lng": "-34.4618"},
          },
          "phone": "010-692-6593 x09125",
          "website": "anastasia.net",
          "company": {
            "name": "Deckow-Crist",
            "catchPhrase": "Proactive didactic contingency",
            "bs": "synergize scalable supply-chains",
          },
        },
        {
          "id": 3,
          "name": "Clementine Bauch",
          "username": "Samantha",
          "email": "Nathan@yesenia.net",
          "address": {
            "street": "Douglas Extension",
            "suite": "Suite 847",
            "city": "McKenziehaven",
            "zipcode": "59590-4157",
            "geo": {"lat": "-68.6102", "lng": "-47.0653"},
          },
          "phone": "1-463-123-4447",
          "website": "ramiro.info",
          "company": {
            "name": "Romaguera-Jacobson",
            "catchPhrase": "Face to face bifurcated interface",
            "bs": "e-enable strategic applications",
          },
        },
      ]);
    });
    test('전체 가져오기', () async {
      final List<User> users = await userRepository.getItems('users.json');

      expect(users.length, 3);
      expect(users.first.id, 1);
      expect(users.first.name, 'Leanne Graham');
    });
    test('이름순 10명', () async {
      final List<User> users = await userRepository.getItemsTop10ByUserName(
        'users.json',
      );

      expect(users.length, 3);
      expect(users.first.id, 3);
      expect(users.first.name, 'Clementine Bauch');
    });
    test('받아오기 실패', () async {
      expect(
        () async => await userDataSource.getItems('users2.json'),
        throwsA(isArgumentError),
      );
    });
  });
}
