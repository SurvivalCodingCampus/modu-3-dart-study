import '../../../assignments/2025-04-01/utils/json_data_source.dart';

abstract class MockJsonDataSource extends JsonDataSource {
  final Map<String, List<Map<String, dynamic>>> mockData = {};
  final Map<String, Map<String, dynamic>> mockSingleData = {};

  void setMockData(String fileName, List<Map<String, dynamic>> data) {
    mockData[fileName] = data;
  }

  void setMockSingleData(String fileName, Map<String, dynamic> data) {
    mockSingleData[fileName] = data;
  }

  @override
  Future<List<Map<String, dynamic>>> getItems(String fileName) async {
    if (mockData.containsKey(fileName)) {
      return mockData[fileName]!;
    }
    throw ArgumentError('Mock data not set for file: $fileName');
  }

  @override
  Future<Map<String, dynamic>> getItem(String fileName) async {
    if (mockSingleData.containsKey(fileName)) {
      return mockSingleData[fileName]!;
    }

    throw ArgumentError('Mock single data not set for file: $fileName');
  }
}
