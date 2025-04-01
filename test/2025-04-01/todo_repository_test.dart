import 'package:modu_3_dart_study/2025-04-01/data_source/local/todo_local_datasource_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/data_source/mock/mock_todo_datasource_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/model/todo.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/interface/todo_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/todo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  late TodoRepository repository;

  setUp(() {
    // mock 데이터 사용 시
    repository = TodoRepositoryImpl(MockTodoDatasourceImpl());
    // 실제 로컬 파일 사용 시
    // repository = TodoRepositoryImpl(TodoLocalDatasourceImpl());
  });

  group('TodoRepository 공통 테스트', () {
    test('전체 할 일 목록 조회는 Todo 리스트를 반환해야 함', () async {
      final todos = await repository.getTodos();

      print('▶ 총 ${todos.length}개의 할 일이 조회됨');
      for (final todo in todos) {
        print(
          ' - [id: ${todo.id}] title: ${todo.title}, 완료여부: ${todo.completed}',
        );
      }

      expect(todos, isA<List<Todo>>());

      print('✅ 전체 할 일 조회 테스트 통과\n');
    });

    test('완료된 할 일만 반환되어야 함', () async {
      final completedTodos = await repository.getCompletedTodos();

      print('▶ 완료된 항목: ${completedTodos.length}개');
      for (final todo in completedTodos) {
        print(
          ' - [id: ${todo.id}] title: ${todo.title}, 완료여부: ${todo.completed}',
        );
      }

      expect(completedTodos, isA<List<Todo>>());
      expect(completedTodos.every((e) => e.completed), isTrue);

      print('✅ 완료 필터링 테스트 통과\n');
    });
  });
}
