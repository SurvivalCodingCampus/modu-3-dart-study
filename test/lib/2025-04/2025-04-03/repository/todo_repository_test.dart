import 'package:modu_3_dart_study/2025-04/2025-04-03/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-03/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-03/model/todo.dart' show Todo;
import 'package:modu_3_dart_study/2025-04/2025-04-03/repository/todo_repository.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-03/repository/todo_repository_impl.dart';
import 'package:test/test.dart';

import '../mock/mock_http_client.dart' show mockClient;

void main() {
  final TodoDataSource normalSource = TodoDataSourceImpl(
    mockClient,
    url: 'https://jsonplaceholder.typicode.com',
  );

  final TodoDataSource errorSource = TodoDataSourceImpl(
    mockClient,
    url: 'https://example.com',
  );

  final TodoRepository repository = TodoRepositoryImpl(normalSource);

  test('findAll() 호출 시 List<Todo>를 반환해야한다.', () async {
    List<Todo> todos = await repository.findAll();
    expect(todos[0].title, equals('Test Todo 1'));
  });

  test('findOne() 호출 시 Todo를 반환해야한다.', () async {
    Todo todo = await repository.findOne(1);
    expect(todo.title, equals('Test Todo 1'));
  });

  test('네트워크 에러 시 Exception을 반환해야한다.', () async {
    const String example = 'https://example.com';

    final TodoDataSource dataSource = TodoDataSourceImpl(
      mockClient,
      url: example,
    );
    final TodoRepository repository = TodoRepositoryImpl(dataSource);

    expect(() async => await repository.findAll(), throwsException);
  });

  test('네트워크 에러 시 호출 시 Exception를 반환해야한다.', () async {
    final TodoRepository repository = TodoRepositoryImpl(errorSource);
    expect(() async => await repository.findOne(1), throwsException);
  });

  test('존재하지 않는 id의 Todo를 조회 시 Exception을 반환해야한다.', () async {
    final TodoRepository repository = TodoRepositoryImpl(normalSource);
    expect(() async => await repository.findOne(999), throwsException);
  });
}
