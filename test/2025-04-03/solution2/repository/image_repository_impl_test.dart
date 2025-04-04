import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:intl/intl.dart';
import 'package:modu_3_dart_study/2025-04-03/solution2/data_source/image_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/solution2/data_source/image_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/solution2/repository/image_repository.dart';
import 'package:modu_3_dart_study/2025-04-03/solution2/repository/image_repository_impl.dart';
import 'package:test/test.dart';

void main() async {
  test('이미지 다운로드  테스트', () async {
    Uint8List mockImage = Uint8List.fromList([]);

    MockClient client = MockClient((request) async {
      return http.Response.bytes(
        mockImage,
        200,
        headers: {'Content-Type': 'application/json; charset=utf-8'},
      );
    });

    ImageDataSource mockImageDataSource = MockImageDataSourceImpl(
      client: client,
    );

    if (await File('lib/2025-04-03/solution2/im0.png').exists()) {
      mockImage = await File('lib/2025-04-03/solution2/im0.png').readAsBytes();
    } else {
      mockImage = await mockImageDataSource.fetchImage(
        'https://picsum'
        '.photos/200',
      );
    }

    Uint8List imageData = await mockImageDataSource.fetchImage(
      'https://stackoverflow.com/questions/52299112/flutter-download-an-image-from-url',
    );

    expect(imageData, mockImage);
  });

  test('이미지 다운로드 저장 테스트', () async {
    Uint8List mockImage = Uint8List.fromList([]);

    MockClient client = MockClient((request) async {
      return http.Response.bytes(
        mockImage,
        200,
        headers: {'Content-Type': 'application/json; charset=utf-8'},
      );
    });

    ImageDataSource mockImageDataSource = MockImageDataSourceImpl(
      client: client,
    );

    if (await File('lib/2025-04-03/solution2/im0.png').exists()) {
      mockImage = await File('lib/2025-04-03/solution2/im0.png').readAsBytes();
    } else {
      mockImage = await mockImageDataSource.fetchImage(
        'https://picsum'
        '.photos/200',
      );
    }

    Uint8List imageData = await mockImageDataSource.fetchImage(
      'https://stackoverflow.com/questions/52299112/flutter-download-an-image-from-url',
    );

    await mockImageDataSource.saveImage(
      imageData,
      '${DateFormat('yyyy-MM-dd-hh-mm-ss'
      '').format(DateTime.now())}'
      '.png',
    );
  });

  test("여러 이미지를 디렉토리에 저장", () async {
    List<String> urlList = List.generate(10, (index) {
      return 'https://picsum.photos/200';
    });

    ImageRepository imageRepository = ImageRepositoryImpl();

    await imageRepository.saveImages(urlList, 'downloadImage');
  });
}
