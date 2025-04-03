import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import '../data_source/image_data_source.dart';
import '../data_source/image_data_source_impl.dart';
import 'image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource _imageDataSource;
  const ImageRepositoryImpl(this._imageDataSource);

  @override
  Future<void> saveImages(List<String> urls, String directory) async {
    Directory(directory).createSync(recursive: true);

    for (String url in urls) {
      String fileName = _getFileNameFromUrl();
      String path = "$directory/$fileName";
      await saveImage(url, path);
    }
  }

  @override
  Future<void> saveImage(String url, String path) async {
    Uint8List imageBytes = await _imageDataSource.fetchImage(url);
    await _imageDataSource.saveImage(imageBytes, path);
  }
}

String _getFileNameFromUrl() {
  DateTime now = DateTime.now();
  String date = "${now.year}-${now.month}-${now.day}";
  int randomNum = Random().nextInt(100000);
  return "지롱사진모음_${date}_$randomNum.jpg";
}

void main() async {
  String directory = "${Directory.current.path}/assets/image/download";

  List<String> urls = [
    "https://mblogthumb-phinf.pstatic.net/MjAyMTAzMjJfMjU2/MDAxNjE2MzkwNTk3NTA3.IsO6H2dPQJEMZpStt4gKQbhPUrtrU8DM3zEbADlh5QMg.Y05dcXvX_ZASn70Cd45kCk4K8Dl0mJOkrXz44P8XWx4g.JPEG.chooddingg/output_4182079403.jpg?type=w800",
    "https://mblogthumb-phinf.pstatic.net/MjAyMTA4MjJfMTk3/MDAxNjI5NTYxNTc2MTU0.40J2KZp4_5hwi9BOPuzG-OhTb47OCIzWhPNRbEn5o6Yg.v90o_lyR3eF1OM4nVjpUqaLbIkQ-kMnQk4f3qyKVvMAg.JPEG.chooddingg/IMG_5742.JPG?type=w800",
  ];

  ImageDataSource imageDataSource = ImageDataSourceImpl();
  ImageRepository imageRepository = ImageRepositoryImpl(imageDataSource);

  await imageRepository.saveImages(urls, directory);
  print("모든 이미지 저장 완료!");
}
