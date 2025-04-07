import 'data_source/photo_data_source_impl.dart';
import 'repository/photo_repository.dart';
import 'repository/photo_repository_impl.dart';

void main() async {
  final photoDataSourceImpl = PhotoDataSourceImpl();
  final PhotoRepository photoRepository = PhotoRepositoryImpl(
    photoDataSource: photoDataSourceImpl,
  );

  // print(await photoDataSourceImpl.getPhotos());
  // print(await photoRepository.getPhotos());
  print(await photoRepository.getPhoto(3));
}
