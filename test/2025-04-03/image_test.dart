import 'package:test/test.dart';

import '../../assignments/2025-04-03/image/data_source/image_data_source.dart';
import '../../assignments/2025-04-03/image/data_source/image_data_source_impl.dart';
import '../../assignments/2025-04-03/image/repository/image_repository.dart';
import '../../assignments/2025-04-03/image/repository/image_repository_impl.dart';

void main() {
  const imageUrl1 =
      'https://thumbnews.nateimg.co.kr/view610///news.nateimg.co.kr/orgImg/th/2024/09/19/c3017c67-fc43-4d63-9346-23f8e832597d.jpg';

  const imageUrl2 =
      'https://i.pinimg.com/736x/8f/63/4b/8f634b60b91ed9fc656d98c3e20bb5aa.jpg';

  const imageUrl3 = 'https://fimg5.pann.com/new/download.jsp?FileID=63411695';

  const imageUrlList = [imageUrl1, imageUrl2, imageUrl3];
  test('Image test', () async {
    final ImageDataSource imageDataSource = ImageDataSourceImpl();
    final path = 'assignments/2025-04-03/image/data/image.png';
    final ImageRepository imageRepository = ImageRepositoryImpl(
      dataSource: imageDataSource,
    );
    await imageRepository.saveImage(imageUrl2, path);
    await imageRepository.saveImages(
      imageUrlList,
      'assignments/2025-04-03/image/data',
    );
  });
}
