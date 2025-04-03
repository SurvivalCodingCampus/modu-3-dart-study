import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import 'package:modu_3_dart_study/2025-04/2025-04-03/data_source/image_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-03/data_source/image_data_source_impl.dart';
import 'package:test/test.dart';

void main() {
  const String url =
      'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRI55C9_NFCG5zYi1YP9O55eJ0XtW-iBz1ZfiGkxns2Xmo9F6irudwooN7kzH55XpoTEwgLBLH34Tmsnn0h7hdVGlPvmOCeQiXlks5w_fiK';

  final http.Client client = http.Client();
  final ImageDataSource dataSource = ImageDataSourceImpl(client);

  test('fetchImage()를 호출하면 Uint8List를 반환해야한다.', () async {
    final Uint8List imageBytes = await dataSource.fetchImage(url);
    expect(imageBytes, isA<Uint8List>());
  });

  test('saveImage()를 호출하면 Uint8List를 이미지로 저장해야한다.', () async {
    // Given
    File file = File('test/lib/2025-04/2025-04-03/image.png');
    final Uint8List imageBytes = await dataSource.fetchImage(url);

    // When
    await dataSource.saveImage(imageBytes, file.path);

    // Then
    expect(await file.exists(), isTrue);

    // After
    addTearDown(() async {
      await file.delete();
    });
  });
}
