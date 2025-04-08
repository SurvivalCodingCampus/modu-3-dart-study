import 'package:dotenv/dotenv.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/core/photo_error.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/dto/photo_dto.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/model/photo.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/repository/photo_repository.dart';
import 'package:modu_3_dart_study/common/data_source.dart';
import 'package:modu_3_dart_study/core/result.dart';

class HttpPhotoRepository implements PhotoRepository {
  final DataSource<Map<String, dynamic>> _dataSource;
  late String _baseUrl;
  late String _apiKey;
  Set<String> profanity = {'바보', '멍청이'};

  HttpPhotoRepository(this._dataSource) {
    DotEnv env = DotEnv()..load();

    _baseUrl = env['PIXABAY_API_URL']!;
    _apiKey = env['PIXABAY_API_KEY']!;
  }

  String get _url => '$_baseUrl/?key=$_apiKey&q=';

  @override
  Future<Result<List<Photo>, PhotoError>> getPhotos(String query) async {
    if (profanity.contains(query)) {
      return Result.failure(PhotoError.profanityError);
    }

    try {
      final List<Map<String, dynamic>> response = await _dataSource.fetch(
        _url + query,
      );

      final dtos = response.map((data) => PhotoDto.fromJson(data));
      final List<Photo> photos = dtos.map((e) => e.toModel()).toList();

      return Result.success(photos);
    } on Exception {
      return Result.failure(PhotoError.networkError);
    }
  }
}
