import 'package:modu_3_dart_study/2025-04-03/data_source/image_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/repositroy/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  ImageDataSource imageDataSource;

  ImageRepositoryImpl(this.imageDataSource);

  @override
  Future<void> saveImage(String url, String path) async {
    final bytes = await imageDataSource.fetchImage(url);
    await imageDataSource.saveImage(bytes, path);
  }

  @override
  Future<void> saveImages(List<String> urls, String directory) async {
    for (int i = 0; i < urls.length; i++) {
      final url = urls[i];
      final bytes = await imageDataSource.fetchImage(url);
      final filePath = '$directory/images_$i.jpg';
      await imageDataSource.saveImage(bytes, filePath);
    }
  }
}

