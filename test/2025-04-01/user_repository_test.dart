import 'package:modu_3_dart_study/2025-04-01/data_source/local/user_local_datasource_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/data_source/mock/mock_user_datasource_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/model/user.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/interface/user_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/user_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  late UserRepository repository;

  const int topCount = 10;

  setUp(() {
    // mock 데이터 사용 시
    repository = UserRepositoryImpl(MockUserDatasourceImpl());
    // 실제 로컬 파일 사용 시
    // repository = UserRepositoryImpl(UserLocalDatasourceImpl());
  });

  group('UserRepository 공통 테스트', () {
    test('전체 사용자 목록은 User 리스트여야 함', () async {
      final users = await repository.getUsers();

      print('▶ 총 ${users.length}명의 유저가 조회됨');
      for (final user in users) {
        print(
          ' - [id: ${user.id}] username: ${user.username}, name: ${user.name}',
        );
      }

      expect(users, isA<List<User>>());

      print('✅ 전체 유저 조회 테스트 통과\n');
    });

    test('username 기준 오름차순 상위 10명만 반환되어야 함', () async {
      final topUsers = await repository.getUsersTop10ByUserName();

      print('▶ username 기준 오름차순 상위 ${topUsers.length}명');
      for (final user in topUsers) {
        print(
          ' - [id: ${user.id}] username: ${user.username}, name: ${user.name}',
        );
      }

      final sorted = List<User>.from(topUsers)
        ..sort((a, b) => a.username.compareTo(b.username));

      expect(topUsers, isA<List<User>>());
      expect(topUsers.length, topCount);
      expect(topUsers, sorted);

      print('✅ Top10 정렬 테스트 통과\n');
    });
  });
}
