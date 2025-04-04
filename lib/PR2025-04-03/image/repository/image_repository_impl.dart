import 'package:modu_3_dart_study/PR2025-04-03/image/data_source/image_data_source.dart';
import 'package:modu_3_dart_study/PR2025-04-03/image/data_source/image_data_source_impl.dart';
import 'package:modu_3_dart_study/PR2025-04-03/image/repository/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource _dataSource;

  const ImageRepositoryImpl(this._dataSource);

  @override
  Future<void> saveImage(String url, String path) async {
    await _dataSource.saveImage(await _dataSource.fetchImage(url), path);
  }

  @override
  Future<void> saveImages(List<String> urls, String directory) async {
    for (String url in urls) {
      String filename = Uri.parse(url).pathSegments.last;
      String path = '$directory/$filename';
      await saveImage(url, path);
    }
  }
}

void main() async {
  ImageDataSource imageDataSource = ImageDataSourceImpl();
  ImageRepository imageRepository = ImageRepositoryImpl(imageDataSource);
  imageRepository.saveImage(
    'https://i.namu.wiki/i/E6SRlNTAIyapASN5QCUOE5L5yfbrzUabHun2Nk8Kqygy5gA5s7Uvj3kixUfLV_OkbYzccg6FoHA7A2fY3DaeMsg2IK1za6QACGAfLkT1At6THr17PfxE4RQr38PApP4ZXCr__86FD5m7BvdEy1ELeAwn80IxzkqWAjtG5OhvaB0.webp',
    'image.jpg',
  );
}
