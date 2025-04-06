import 'dart:convert';
import 'dart:io';
import 'package:modu_3_dart_study/2025-04-03/solution1/data_sourece/store_data_source.dart';

class StoreDataSourceImpl implements StoreDataSource {

  final String filePath;

  StoreDataSourceImpl(this.filePath);

  @override
  Future<List<Map<String, dynamic>>> readAllStores() async {
    final File file = File(filePath);
    final String jsonString = await file.readAsString();
    final List<dynamic> stores = jsonDecode(jsonString)['stores'];

    return List<Map<String, dynamic>>.from(stores);
  }
}