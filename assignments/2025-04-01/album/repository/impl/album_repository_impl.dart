import '../../../utils/json_repository.dart';
import '../../data_source/impl/album_data_source_impl.dart';
import '../../model/album.dart';
import '../album_repository.dart';

class AlbumRepositoryImpl
    extends JsonRepository<Album, int, AlbumDataSourceImpl>
    implements AlbumRepository {
  AlbumRepositoryImpl(super.dataSource, super.entity);
}
