import '../../../utils/json_repository.dart';
import '../../data_source/impl/photo_data_source_impl.dart';
import '../../model/photo.dart';
import '../photo_repository.dart';

class PhotoRepositoryImpl
    extends JsonRepository<Photo, int, PhotoDataSourceImpl>
    implements PhotoRepository {
  const PhotoRepositoryImpl(super.photoDataSource, super.photo);
}
