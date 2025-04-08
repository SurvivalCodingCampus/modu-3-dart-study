import 'dart:convert';

import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/core/costants/api/api_urls.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/photo/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/photo/dto/photo_dto.dart';
import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/photo/model/pixabay_params.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final String _path = ApiUrls.pixabayApiUrl;

  @override
  Future<PhotoResultDto> getPhotos(List<String> tags) async {
    final queries = PixabayParams(tags: tags);
    final resp = await http.get(Uri.parse(_path + queries.toQuery()));
    final photoDto = PhotoResultDto.fromJson(jsonDecode(resp.body));
    return photoDto;
  }
}
