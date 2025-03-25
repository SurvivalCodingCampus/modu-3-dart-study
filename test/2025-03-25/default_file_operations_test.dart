import 'dart:io';

import 'package:modu_3_dart_study/2025-03-25/default_file_operations.dart';
import 'package:test/test.dart';

void main() {
  group('[DefaultFileOperations] - ', () {
    DefaultFileOperations fileOperations = DefaultFileOperations();
    String sourceFileName = 'sourceFile.txt';
    String targetFileName = 'targetFileName.txt';

    test('파일 copy', () {
      fileOperations.copy(sourceFileName, targetFileName);
      expect(File(targetFileName).existsSync(), isTrue);
    });

    test('파일명이 잘못되었을 때', () {
      sourceFileName = 'wrongFileName.txt';

      expect(
        () => fileOperations.copy(sourceFileName, targetFileName),
        throwsA(isArgumentError),
      );
    });
  });
}
