import 'dart:io';

import 'package:test/test.dart';

void main() {
  test('DefaultFileOperations', () {
    final originalFile = File(
      '/Users/heojunho/modu-3-dart-study/assignments/2025-03-25/src/solution/exception.dart',
    );
    final copiedFile = File(
      '/Users/heojunho/modu-3-dart-study/assignments/2025-03-25/src/solution/exception_copy.dart',
    );

    expect(originalFile.readAsStringSync(), copiedFile.readAsStringSync());
  });
}
