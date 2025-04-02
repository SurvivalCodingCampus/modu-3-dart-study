import 'package:modu_3_dart_study/2025-04-01/data_source/local/user_local_datasource_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/data_source/mock/mock_user_datasource_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/model/user.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/interface/user_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/user_repository_impl.dart';
import 'package:test/test.dart';


void main() {
  late UserRepositoryImpl repository;

  const int topCount = 10;

  setUp(() {
    // mock 데이터 사용 시
    // repository = UserRepositoryImpl(MockUserDatasourceImpl());
    // 실제 로컬 파일 사용 시
    repository = UserRepositoryImpl(UserLocalDatasourceImpl());
  });

  group('UserRepository 테스트', () {
    test('모든 사용자 리스트 가져오기', () async {
      final users = await repository.getUsers();
      print('사용자 수: ${users.length}');
      for (final user in users) {
        print(user);
      }
      expect(users.isNotEmpty, isTrue);
    });

    test('username 기준 오름차순 Top10', () async {
      final top10 = await repository.getUsersTop10ByUserName();
      print('Top$topCount 사용자:');
      for (final user in top10) {
        print(user.username);
      }

      final sorted = [...top10];
      sorted.sort((a, b) => a.username.compareTo(b.username));

      expect(top10.length <= topCount, isTrue);
      expect(top10, equals(sorted));
    });
  });
}
