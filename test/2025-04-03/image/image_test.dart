import 'dart:io';

import 'package:modu_3_dart_study/2025-04-03/image/data_source/impl/image_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/image/repository/image_repository.dart';
import 'package:modu_3_dart_study/2025-04-03/image/repository/impl/image_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  const String imageUrl =
      'https://i.namu.wiki/i/L4GcKllq88ggu1I-StGmTG4QQGXWOOH2dbUmSlzp_P6cUrIJLKcbWOVUqhngG-TAe5nYB0DkY3hVeq774IFSag.webp';
  const String imageUrl2 =
      'https://i.namu.wiki/i/OogyfRXbeSJbL0fhNSbr7Gi63SgkvibkgneKeOQCp_TjmIoPkXs_Np3lEnRDPLkNsIA9sFXoZqhDqQD8qTYTsQ.webp';

  const String fileName = 'oneokrock.webp';
  const String directoryName = 'Jband';

  late ImageRepository imageRepository;

  group('사진 : ', () {
    setUpAll(() {
      imageRepository = ImageRepositoryImpl(ImageDataSourceImpl());
    });
    test('하나만 저장', () async {
      await imageRepository.saveIamge(imageUrl, fileName);

      expect(await File(fileName).exists(), true);
    });

    test('다수 저장', () async {
      await imageRepository.saveImages([imageUrl, imageUrl2], directoryName);

      expect(await Directory(directoryName).exists(), true);
    });

    tearDownAll(() async {
      await File(fileName).delete();
      await Directory(directoryName).delete(recursive: true);
    });
  });
}
