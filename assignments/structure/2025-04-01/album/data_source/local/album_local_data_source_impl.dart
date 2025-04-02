import '../../../base/base_data_source_impl.dart';
import '../album_data_source.dart';

class AlbumLocalDataSourceImpl extends BaseDataSourceImpl implements AlbumDataSource {
  @override
  Future<List<Map<String, dynamic>>> getAlbums() async {
    final path = 'assignments/structure/2025-04-01/album/data/album.json';
    final resp = await getList(path);
    return resp;
  }
}