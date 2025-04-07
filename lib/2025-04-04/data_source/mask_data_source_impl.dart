import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-04/data_source/mask_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/dto/mask_dto.dart';

class MaskDataSourceImpl implements MaskDataSource {
  final http.Client client;

  MaskDataSourceImpl({http.Client? client}) : client = client ?? http.Client();

  @override
  Future<List<MaskDto>> getMasks() async {
    final url = Uri.parse(
      'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json',
    );
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> datas = jsonDecode(response.body)['stores'];
      return datas.map((e) => MaskDto.fromJson(e)).toList();
    } else {
      throw Exception('데이터 불러오기 실패: ${response.statusCode}');
    }
  }
}