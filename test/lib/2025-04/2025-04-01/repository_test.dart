import 'package:modu_3_dart_study/2025-04/2025-04-01/data_source/mock/mock_album_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-01/data_source/mock/mock_comment_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-01/data_source/mock/mock_photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-01/data_source/mock/mock_todo_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-01/data_source/mock/mock_user_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-01/model/album.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-01/model/comment.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-01/model/photo.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-01/model/todo.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-01/model/user.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-01/repository/album_repository.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-01/repository/comment_repository.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-01/repository/photo_repository.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-01/repository/todo_repository.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-01/repository/user_repository.dart';
import 'package:modu_3_dart_study/2025-04/data_source.dart';
import 'package:test/test.dart';

void main() {
  group('CommentRepository - ', () {
    final DataSource<Comment> source = MockCommentDataSource();
    final CommentRepository repository = CommentRepository(source);

    test('getComments(int postId)', () async {
      final List<Comment> comments = await repository.getComments(1);
      expect(comments.length, 2);
      expect(comments.last.name, equals('Dart'));
    });
  });

  group('PhotoRepository - ', () {
    final DataSource<Photo> source = MockPhotoDataSource();
    final PhotoRepository repository = PhotoRepository(source);

    test('getPhotos(int albumId)', () async {
      final List<Photo> comments = await repository.getPhotos(1);
      expect(comments.first.title, equals('title'));
    });
  });

  group('TodoRepository - ', () {
    final DataSource<Todo> source = MockTodoDataSource();
    final TodoRepository repository = TodoRepository(source);

    test('getTodos()', () async {
      List<Todo> todos = await repository.getTodos();

      expect(todos.length, 2);
      expect(todos.first.completed, isTrue);
    });

    test('getCompletedTodos()', () async {
      List<Todo> todos = await repository.getCompletedTodos();

      expect(todos.length, 1);
      expect(todos.first.userId, 3);
    });
  });

  group('UserRepository - ', () {
    final DataSource<User> source = MockUserDataSource();
    final UserRepository repository = UserRepository(source);

    test('getUsers()', () async {
      List<User> users = await repository.getUsers();

      expect(users.length, 3);
      expect(users.first.name, 'Dart');
    });

    test('getUsersTop10ByUsername()', () async {
      List<User> users = await repository.getUsersTop10ByUsername();
      expect(users.first.username, 'A');
    });
  });

  group('AlbumRepository - ', () {
    final DataSource<Album> source = MockAlbumDataSource();
    final AlbumRepository repository = AlbumRepository(source);

    test('getAlbums({int? limit = 0})', () async {
      List<Album> albums = await repository.getAlbums();

      expect(albums.length, 4);
    });

    test('getAlbums({int? limit = 2})', () async {
      List<Album> albums = await repository.getAlbums(limit: 2);

      expect(albums.length, 2);
    });
  });
}
