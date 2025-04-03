import 'image/data/data.dart';
import 'image/data_source/image_data_source.dart';
import 'image/data_source/image_data_source_impl.dart';
import 'image/repository/image_repository.dart';
import 'image/repository/image_repository_impl.dart';

void main(List<String> args) async {
  final ImageDataSource imageDataSource = ImageDataSourceImpl();
  final result = await imageDataSource.fetchImage(imageUrl1);
  print(result);
  print(result.length);
  final path = 'assignments/2025-04-03/image/data/image.png';
  await imageDataSource.saveImage(result, path);

  final ImageRepository imageRepository = ImageRepositoryImpl(
    dataSource: imageDataSource,
  );
  imageRepository.saveImage(imageUrl2, path);

  const imageUrlList = [imageUrl1, imageUrl2, imageUrl3];
  imageRepository.saveImages(imageUrlList, 'assignments/2025-04-03/image/data');
}
