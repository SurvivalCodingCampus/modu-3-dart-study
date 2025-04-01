import '../../utils/json_repository.dart';
import '../data_source/impl/album_data_source_impl.dart';
import '../model/album.dart';

abstract interface class AlbumRepository
    extends JsonRepository<Album, int, AlbumDataSourceImpl> {
  AlbumRepository(super.dataSource, super.entity);
}
