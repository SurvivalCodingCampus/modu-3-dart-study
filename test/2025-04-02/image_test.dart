import 'package:modu_3_dart_study/2025-04-02/data_source/image_data_source.dart';
import 'package:modu_3_dart_study/2025-04-02/data_source/impl/image_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-02/repository/image_repository.dart';
import 'package:modu_3_dart_study/2025-04-02/repository/image_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  String directory = r'C:\dev\DartProjects\modu-3-dart-study\test\2025-04-02\';
  String imageUrl1 = 'https://investpension.miraeasset.com/common/namoeditor/binary/images/000221/1699578341561.jpg';
  String imageUrl2 = 'https://img-cdn.inc.com/image/upload/f_webp,c_fit,w_1920,q_auto/images/panoramic/getty_505175324_2000131020009280327_186071.jpg';
  String imageUrl3 = 'https://news.kbs.co.kr/data/news/2017/04/04/3457378_RKu.png';

  List<String> imageUrls = [imageUrl1, imageUrl2, imageUrl3];

  test('이미지 1장 다온로드/저장', () async {
    ImageDataSource imageDataSourceImpl = ImageDataSourceImpl();
    ImageRepository imageRepositoryImpl = ImageRepositoryImpl(imageDataSource: imageDataSourceImpl);

    //한장 저장
    await imageRepositoryImpl.saveImage(imageUrl1, directory + 'happy_image1.jpg');
    expect(() async => await imageRepositoryImpl.saveImage(imageUrl1, directory + 'happy_image1.jpg'),returnsNormally);
  });

  test('이미지 3장 다온로드/저장', () async {
    ImageDataSource imageDataSourceImpl = ImageDataSourceImpl();
    ImageRepository imageRepositoryImpl = ImageRepositoryImpl(imageDataSource: imageDataSourceImpl);

    //이미지 3장 저장
    await imageRepositoryImpl.saveImages(imageUrls, directory);
    expect(() async => await imageRepositoryImpl.saveImages(imageUrls, directory),returnsNormally);
  });

}