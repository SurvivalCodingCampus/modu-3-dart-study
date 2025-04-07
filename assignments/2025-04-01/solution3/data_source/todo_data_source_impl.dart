import 'dart:convert';
import 'dart:io';

import '../../../2025-04-01/solution3/data_source/todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  String path;

  @override
  Future<List<Map<String, dynamic>>> fetchData() async {
    File file = File(path);
    String fileString = await file.readAsString();
    List fileDecode = jsonDecode(fileString);
    List<Map<String, dynamic>> dataList = [];
    for (Map<String, dynamic> items in fileDecode) {
      dataList.add(items);
    }
    return dataList;
  }

  TodoDataSourceImpl({required this.path});
}
