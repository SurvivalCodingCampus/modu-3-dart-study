import 'dart:io';

import 'package:modu_3_dart_study/2025-03-25/default_file_operations.dart';
import 'package:modu_3_dart_study/2025-03-25/file_operations.dart';
import 'package:test/test.dart';

void main() {
  test('DefaultFileOperations는 FileOperations 인터페이스를 구현해야한다.', () {
    expect(DefaultFileOperations(), isA<FileOperations>());
  });

  test('원본 경로의 파일을 목표 경로에 정확히 복사해야한다.', () {
    // GIVEN
    const String originPath = 'playground/2025-03-25/my_file.txt';
    const String targetPath = 'test/lib/2025-03-25/test.txt';
    DefaultFileOperations df = DefaultFileOperations();

    // WHEN
    df.copy(originPath, targetPath);
    File origin = File(originPath);
    File target = File(targetPath);
    bool exist = target.existsSync();

    // THEN
    expect(exist, isTrue);
    expect(origin.readAsStringSync(), equals(target.readAsStringSync()));

    // After
    addTearDown(() {
      target.deleteSync();
    });
  });
}
