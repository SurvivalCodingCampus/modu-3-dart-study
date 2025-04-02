import 'package:modu_3_dart_study/2025-04/2025-04-01/model/album.dart';
import 'package:modu_3_dart_study/2025-04/data_source.dart';
import 'package:modu_3_dart_study/2025-04/repository.dart';

class AlbumRepository implements Repository<Album, int> {
  final DataSource<Album> _source;

  const AlbumRepository(this._source);

  @override
  Future<List<Album>> findAll() async {
    return await _source.load();
  }

  Future<List<Album>> getAlbums({int? limit}) async {
    List<Album> albums = await _source.load();
    if (limit != null) return albums.take(limit).toList();

    return await _source.load();
  }

  @override
  Future<Album> findOne(int id) async {
    List<Album> albums = await _source.load();
    return albums.firstWhere((e) => e.id == id);
  }
}
