import 'package:modu_3_dart_study/2025-04/2025-04-01/model/photo.dart';
import 'package:modu_3_dart_study/2025-04/data_source.dart';

class MockPhotoDataSource implements DataSource<Photo> {
  @override
  Future<List<Photo>> load({String? relativePath = ''}) async {
    return [
      Photo(
        id: 1,
        albumId: 1,
        thumbnailUrl: 'thumbnailUrl',
        title: 'title',
        url: 'url',
      ),
    ];
  }
}
