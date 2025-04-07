import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-04/exam1/data_source/photo_data_source.dart';

import '../dto/photo_dto.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final http.Client client = http.Client();

  @override
  Future<List<PhotoDto>> fetchPhoto() async {
    final photoJson = File('lib/2025-04-04/exam1/mock_json/mock_exam2.json');
    String jsonString= await photoJson.readAsString();
    List<Map<String, dynamic>> jsonList = List<Map<String, dynamic>>.from(jsonDecode(jsonString));
    return jsonList.map((e) => PhotoDto.fromJson(e)).toList();
  }
}