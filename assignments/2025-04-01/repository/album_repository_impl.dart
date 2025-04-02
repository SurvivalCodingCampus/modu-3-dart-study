import '../data_source/album_data_source.dart';
import '../model/album.dart';
import 'album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _dataSource;
  static late List<Album> _allAlbums;
  AlbumRepositoryImpl({required AlbumDataSource dataSource})
    : _dataSource = dataSource;

  Future<void> init() async {
    final jsonList = await _dataSource.getAllAlbums();
    _allAlbums = jsonList.map((e) => Album.fromJson(e)).toList();
  }

  @override
  List<Album> getAlbums({int? limit}) {
    if (_allAlbums.isEmpty) {
      throw Exception('allAlbums 초기화 안됨');
    }
    return _allAlbums.sublist(0, limit != null && limit < _allAlbums.length ? limit : _allAlbums.length);
  }
}
