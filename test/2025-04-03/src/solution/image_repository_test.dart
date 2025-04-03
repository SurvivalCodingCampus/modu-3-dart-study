import 'dart:io';

import 'package:modu_3_dart_study/assignments/2025-04-03/src/solution/data_source/image_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-03/src/solution/repository/image_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('Image Repository Test', () {
    test('이미지 단일 저장', () async {
      final testUrl =
          'https://www.fitpetmall.com/wp-content/uploads/2023/10/shutterstock_529324609-1.png';
      final basePath = 'lib/assignments/2025-04-03/src/solution/image';
      final fileName = 'dog';
      final repository = ImageRepositoryImpl(
        imageDataSource: ImageDataSourceImpl(),
      );

      await repository.saveImage(testUrl, '$basePath/$fileName');

      expect(
        File(
          'lib/assignments/2025-04-03/src/solution/image/dog.jpg',
        ).existsSync(),
        isTrue,
      );
    });

    test('이미지 복수 저장', () async {
      final testUrl1 =
          'https://www.fitpetmall.com/wp-content/uploads/2023/10/shutterstock_529324609-1.png';
      final testUrl2 =
          'https://www.fitpetmall.com/wp-content/uploads/2023/10/shutterstock_529324609-1.png';
      final basePath = 'lib/assignments/2025-04-03/src/solution/image';

      final repository = ImageRepositoryImpl(
        imageDataSource: ImageDataSourceImpl(),
      );

      await repository.saveImages([testUrl1, testUrl2], basePath);

      expect(
        File(
          'lib/assignments/2025-04-03/src/solution/image/0.jpg',
        ).existsSync(),
        isTrue,
      );
      expect(
        File(
          'lib/assignments/2025-04-03/src/solution/image/1.jpg',
        ).existsSync(),
        isTrue,
      );
    });
  });
}
