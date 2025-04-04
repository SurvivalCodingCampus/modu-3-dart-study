import '../data_source/image_data_source.dart';
import '../data_source/image_data_source_impl.dart';
import 'image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource _imageDataSource;

  ImageRepositoryImpl({required ImageDataSource imageDataSource})
    : _imageDataSource = imageDataSource;

  @override
  Future<void> saveImage(String url, String path) async {
    final imageBytes = await _imageDataSource.fetchImage(url);
    await _imageDataSource.saveImage(imageBytes, path);
  }

  @override
  Future<void> saveImages(List<String> urls, String directory) async {
    for (int i = 0; i < urls.length; i++) {
      final bytes = await _imageDataSource.fetchImage(urls[i]);
      await _imageDataSource.saveImage(bytes, '$directory/$i');
    }
  }
}

void main() async {
  final repository = ImageRepositoryImpl(
    imageDataSource: ImageDataSourceImpl(),
  );

  await repository.saveImages([
    'https://image.dongascience.com/Photo/2017/03/14900752352661.jpg',
    'https://image.dongascience.com/Photo/2017/03/14900752352661.jpg',
    'https://image.dongascience.com/Photo/2017/03/14900752352661.jpg',
  ], 'assignments/2025-04-03/src/solution/image');
}
