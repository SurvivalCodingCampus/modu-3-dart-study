import 'package:modu_3_dart_study/2025-04-03/repository/image_repository.dart';

import '../data_source/image_data_source.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource _imageDataSource;

  ImageRepositoryImpl({required ImageDataSource imageDataSource}) : _imageDataSource = imageDataSource;

  @override
  Future<void> saveImage(String url, String path) async {
    final binaryData = await _imageDataSource.fetchImage(url);
    await _imageDataSource.saveImage(binaryData, path);
  }

  @override
  Future<void> saveImages(List<String> urls, String directory) async {
    final List<Future<void>> operations = [];

    for (final url in urls) {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final path = '$directory/$timestamp';

      final operation = saveImage(url, path).catchError((error) {
        print('Error saving image: $error');
      });
      operations.add(operation);
    }

    await Future.wait(operations);
  }
}