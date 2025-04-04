import 'dart:io';

import 'package:modu_3_dart_study/2025-04-03/data_source/image_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/repository/image_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('ImageRepository 실제 저장 테스트', () {
    late ImageRepositoryImpl repository;
    late String filePath;

    setUp(() {
      repository = ImageRepositoryImpl(dataSource: ImageDataSourceImpl());
    });

    tearDown(() async {
      final file = File(filePath);
      if (await file.exists()) {
        await file.delete();
        print('🧹 테스트 종료 후 파일 삭제: $filePath');
      }
    });

    test('이미지를 test/2025-04-03/data 경로에 저장', () async {
      final url =
          'https://img.khan.co.kr/news/2023/01/02/news-p.v1.20230102.1f95577a65fc42a79ae7f990b39e7c21_P1.webp';
      final fileName = Uri.parse(url).pathSegments.last;
      filePath = 'test/2025-04-03/data/$fileName';

      await repository.saveImage(url, filePath);

      final file = File(filePath);
      final exists = await file.exists();
      expect(exists, isTrue);

      final length = await file.length();
      print('✅ 저장 완료: $filePath ($length bytes)');
      expect(length, greaterThan(0));
    });
  });
}
