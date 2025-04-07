import 'package:modu_3_dart_study/apr/w1/2025-04-03/image/data_source/image_data_source.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-03/image/repository/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource _imageDataSource;

  ImageRepositoryImpl(this._imageDataSource);

  @override
  Future<void> saveImage(String url, String path) async {
    final imageBytes = await _imageDataSource.fetchImage(url);
    await _imageDataSource.saveImage(imageBytes, path);
  }

  @override
  Future<void> saveImages(List<String> urls, String directory) async {
    for (int i = 0; i < urls.length; i++) {
      final url = urls[i];
      final imageName = 'image$i.png';
      final path = '$directory/$imageName';

      final imageBytes = await _imageDataSource.fetchImage(url);
      await _imageDataSource.saveImage(imageBytes, path);
    }
  }
}
