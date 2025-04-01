import '../../utils/json_repository.dart';
import '../data_source/album_data_source.dart';
import '../model/album.dart';

abstract class AlbumRepository
    extends JsonRepository<Album, int, AlbumDataSource> {
  AlbumRepository(super.dataSource, super.entity);
}
