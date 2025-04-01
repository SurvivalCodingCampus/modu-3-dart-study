import 'dart:convert';
import 'dart:io';
import '../user_datasource.dart';

class UserLocalDatasourceImpl implements UserDatasource {
  final String filePath;

  UserLocalDatasourceImpl({this.filePath = 'lib/2025-04-01/data/users.json'});

  @override
  Future<List<Map<String, dynamic>>> fetchUsers() async {
    final file = File(filePath);
    final jsonStr = await file.readAsString();
    final List<dynamic> decoded = json.decode(jsonStr);
    return decoded.cast<Map<String, dynamic>>();
  }
}
