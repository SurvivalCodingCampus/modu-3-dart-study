import 'dart:convert';

import 'package:http/testing.dart';

import 'photo_data_source.dart';

class MockPhotoDataSourceImpl implements PhotoDataSource {
  final MockClient mockClient;

  const MockPhotoDataSourceImpl({required this.mockClient});

  @override
  Future<List<dynamic>> mockGetPhoto() async {
    final mockData = await mockClient.get(
      Uri.parse('https://example.com'),
      headers: {'Content-Type': 'application/json'},
    );

    return jsonDecode(mockData.body);
  }
}
