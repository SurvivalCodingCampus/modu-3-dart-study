import 'package:modu_3_dart_study/assignments/structure/2025-04-03/image/data_source/image_data_source.dart';
import 'package:modu_3_dart_study/assignments/structure/2025-04-03/image/data_source/image_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/structure/2025-04-03/image/repository/image_repository.dart';
import 'package:modu_3_dart_study/assignments/structure/2025-04-03/image/repository/image_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  final ImageDataSource dataSource = ImageDataSourceImpl();
  final ImageRepository repo = ImageRepositoryImpl(dataSource);
  group('이미지 저장 테스트', () {
    test('이미지 한 장 저장 테스트', () async {
      final url = 'https://mediahub.seoul.go.kr/wp-content/uploads/2016/09/61a2981f41200ac8c513a3cbc0010efe.jpg';
      await repo.saveImage(url);
    });

    test('이미지 여러장 저장 테스트', () async {
      final urls = [
        'https://i.namu.wiki/i/9av_QFbUYY-0ehSj1q7UB6CDyQm54ele3wzy0vmUQaACwsKl7PKoZ6ivDViqdmNwcv0D0HPT0TPdxDk4n7RXZA.webp',
        'https://www.kfoodtimes.com/news/photo/201710/4025_6216_1245.PNG',
      ];
      await repo.saveImages(urls);
    });
  });
}