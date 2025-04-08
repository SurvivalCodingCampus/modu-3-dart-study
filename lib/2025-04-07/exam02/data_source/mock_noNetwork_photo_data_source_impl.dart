import 'dart:convert';

import 'package:modu_3_dart_study/2025-04-07/exam02/data_source/photo_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-07/exam02/dto/pixabay_dto.dart';

class MockNonetworkPhotoDataSourceImpl implements PhotoDataSource {
  @override
  Future<PixabayDto> getPixabayData() async {
    final http.Response response = await http.get(
      Uri.parse(
        'https://pixabay.com/api/?key=${String.fromEnvironment('')}&lang=ko&image_type=photo',
      ),
    );

    return PixabayDto.fromJson(jsonDecode(response.body));
  }
}
