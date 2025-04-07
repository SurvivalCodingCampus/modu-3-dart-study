import 'dart:io';

import 'package:test/test.dart';

import 'package:modu_3_dart_study/assignments/2025-04-03/data_source/image_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-03/data_source/image_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-03/repository/image_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-04-03/repository/image_repository_impl.dart';

void main() {
  group('Image', () {
    String directory = "${Directory.current.path}/assets/image/download";
    final List<String> urls = [
      "https://mblogthumb-phinf.pstatic.net/MjAyMTAzMjJfMjU2/MDAxNjE2MzkwNTk3NTA3.IsO6H2dPQJEMZpStt4gKQbhPUrtrU8DM3zEbADlh5QMg.Y05dcXvX_ZASn70Cd45kCk4K8Dl0mJOkrXz44P8XWx4g.JPEG.chooddingg/output_4182079403.jpg?type=w800",
      "https://mblogthumb-phinf.pstatic.net/MjAyMTA4MjJfMTk3/MDAxNjI5NTYxNTc2MTU0.40J2KZp4_5hwi9BOPuzG-OhTb47OCIzWhPNRbEn5o6Yg.v90o_lyR3eF1OM4nVjpUqaLbIkQ-kMnQk4f3qyKVvMAg.JPEG.chooddingg/IMG_5742.JPG?type=w800",
    ];
    test('saveImages() - 성공 응답', () async {
      ImageDataSource imageDataSource = ImageDataSourceImpl();
      ImageRepository imageRepository = ImageRepositoryImpl(imageDataSource);

      await imageRepository.saveImages(urls, directory);
      // 저장전 파일 목록 확인
      final existingFiles =
          Directory(
            directory,
          ).listSync().whereType<File>().map((f) => f.path).toSet();
      await imageRepository.saveImages(urls, directory);

      // 저장후 파일 목록확인
      final updatedFiles =
          Directory(directory).listSync().whereType<File>().toList();
      final newFiles =
          updatedFiles
              .where((file) => !existingFiles.contains(file.path))
              .toList();
      expect(
        newFiles.length,
        urls.length,
        reason: "새로 저장된 파일 개수가 URL 개수와 다릅니다.",
      );

      for (var file in newFiles) {
        expect(file.existsSync(), isTrue);
      }
    });
  });
}
