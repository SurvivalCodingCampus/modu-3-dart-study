import '../../utils/json_repository.dart';
import '../data_source/photo_data_source.dart';
import '../model/photo.dart';

abstract class PhotoRepository
    extends JsonRepository<Photo, int, PhotoDataSource> {
  PhotoRepository(super.dataSource, super.entity);
}
