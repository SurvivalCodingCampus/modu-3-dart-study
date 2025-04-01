import 'dart:convert';
import 'dart:io';
import 'base_data_source.dart';

abstract class BaseDataSourceImpl implements BaseDataSource {
  @override
  Future<List<Map<String, dynamic>>> getList(String path) async {
    final file = File(path);
    final data =
        (jsonDecode(file.readAsStringSync()) as List<dynamic>)
            .map((e) => e as Map<String, dynamic>)
            .toList();
    ;
    await Future.delayed(Duration(seconds: 1));
    return data;
  }
}
