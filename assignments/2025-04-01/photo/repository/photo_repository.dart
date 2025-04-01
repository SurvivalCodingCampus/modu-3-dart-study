import '../../utils/json_repository.dart';
import '../data_source/impl/photo_data_source_impl.dart';
import '../model/photo.dart';

abstract interface class PhotoRepository
    extends JsonRepository<Photo, int, PhotoDataSourceImpl> {
  PhotoRepository(super.dataSource, super.entity);
}
