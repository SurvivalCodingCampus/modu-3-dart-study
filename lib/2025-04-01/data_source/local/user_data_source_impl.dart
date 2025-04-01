import 'dart:convert';
import 'dart:io';
import '../user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  final String filePath;

  UserDataSourceImpl(this.filePath);

  @override
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final File file = File(filePath);
    final String jsonString = await file.readAsString();
    final List<dynamic> data = json.decode(jsonString);
    return List<Map<String, dynamic>>.from(data);
  }
}