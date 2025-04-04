import 'dart:io';

import 'package:modu_3_dart_study/PR2025-04-03/image/data_source/image_data_source_impl.dart';
import 'package:modu_3_dart_study/PR2025-04-03/image/repository/image_repository.dart';
import 'package:modu_3_dart_study/PR2025-04-03/image/repository/image_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  final String url =
      'https://i.namu.wiki/i/E6SRlNTAIyapASN5QCUOE5L5yfbrzUabHun2Nk8Kqygy5gA5s7Uvj3kixUfLV_OkbYzccg6FoHA7A2fY3DaeMsg2IK1za6QACGAfLkT1At6THr17PfxE4RQr38PApP4ZXCr__86FD5m7BvdEy1ELeAwn80IxzkqWAjtG5OhvaB0.webp';
  final String fileName = 'image.webp';
  test('', () async {
    ImageRepository imageRepository = ImageRepositoryImpl(
      ImageDataSourceImpl(),
    );
    await imageRepository.saveImage(url, fileName);
    expect(await File(fileName).exists(), true);
  });
}
