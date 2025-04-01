import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-01/model/user.dart';
import 'package:modu_3_dart_study/2025-04/data_source.dart';
import 'package:modu_3_dart_study/2025-04/repository.dart';

class UserRepository implements Repository<User, int> {
  final DataSource<User> _source;

  const UserRepository(this._source);

  @override
  Future<List<User>> findAll() async {
    return await _source.load();
  }

  @override
  Future<User> findOne(int id) async {
    List<User> todos = await _source.load();
    return todos.firstWhere((e) => e.id == id);
  }

  Future<List<User>> getUsers() async {
    return findAll();
  }

  Future<List<User>> getUsersTop10ByUsername() async {
    List<User> todos = await _source.load();
    return todos.sortedBy((e) => e.username);
  }
}
