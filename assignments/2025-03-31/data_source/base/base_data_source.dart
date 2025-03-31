import '../../service/file_reader.dart';

abstract class BaseDataSource {
  String get path;

  // file Reader로
  // json 데이터 가져오기
  Map<String, dynamic> fetchJson() {
    final fileReader = FileReader(path);
    final json = fileReader.readJson();
    return json;
  }

  // file Reader로
  // csv(List<String>) 데이터 가져오기
  List<String> fetchCsv() {
    final fileReader = FileReader(path);
    final csvData = fileReader.readCsv();
    // 맨 첫줄은 데이터가 아니므로 제거
    final filteredData = csvData.sublist(1);
    return filteredData;
  }

  // 딜레이 함수
  Future<void> fetchDelay() async {
    await Future.delayed(Duration(seconds: 1));
  }
}
