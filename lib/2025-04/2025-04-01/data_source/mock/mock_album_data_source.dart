import 'package:modu_3_dart_study/2025-04/2025-04-01/model/album.dart';
import 'package:modu_3_dart_study/2025-04/data_source.dart';

class MockAlbumDataSource implements DataSource<Album> {
  @override
  Future<List<Album>> load({String? relativePath = ''}) async {
    return [
      Album(id: 1, title: 'A', userId: 1),
      Album(id: 2, title: 'A', userId: 1),
      Album(id: 3, title: 'B', userId: 2),
      Album(id: 4, title: 'C', userId: 3),
    ];
  }
}
