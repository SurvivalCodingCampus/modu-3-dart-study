import '../data_source/mock/mock_photo_data_source_impl.dart';
import '../data_source/photo_data_source.dart';
import '../mepper/photo_mepper.dart';
import '../model/photo.dart';
import 'photo_repository.dart';

import 'package:http/http.dart' as http;

class PhotoRepositoryImp implements PhotoRepository {
  final PhotoDataSource _dataSource;
  PhotoRepositoryImp(this._dataSource);

  @override
  Future<List<Photo>> getPhotoList() async {
    final photoDto = await _dataSource.getPhotoList();
    print('⭐️ 목록 가져오기 ⭐️');
    return photoDto.map((e) => e.toPhoto()).toList();
  }
}

void main() async {
  final httpClient = http.Client();
  final dataSource = MockPhotoDataSourceImpl(httpClient);
  final repository = PhotoRepositoryImp(dataSource);

  final photos = await repository.getPhotoList();
  print(photos);
}
