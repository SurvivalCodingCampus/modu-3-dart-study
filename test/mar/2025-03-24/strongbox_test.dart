import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../playground/mar/2025-03-21/book.dart';
import '../../../playground/mar/2025-03-24/key.dart';
import '../../../playground/mar/2025-03-24/strongbox.dart';

void main() {
  test('strong box', () {
    StrongBox strongBox = StrongBox(KeyType.button);

    strongBox.put('마우스');

    expect(strongBox.unlock(), equals('마우스'));
    expect(strongBox.count, equals(10000));
  });
  test('strong box2', () {
    StrongBox strongBox = StrongBox(KeyType.padlock);

    strongBox.put(100000);

    expect(strongBox.unlock(), equals('100000원'));
    expect(strongBox.count, equals(1024));
  });
  test('strong box3', () {
    StrongBox strongBox = StrongBox(KeyType.finger);

    strongBox.put(100000);
    final result = strongBox.get();

    expect(result, isNull);
    expect(strongBox.count, equals(1));
  });
  test('strong box4', () {
    StrongBox strongBox = StrongBox(KeyType.dial);

    Book book = Book(title: 'CS', comment: '어렵다');
    strongBox.put(book);

    expect(strongBox.unlock(), equals('금고에 들어갈 수 없는 물건입니다.'));
    expect(strongBox.count, equals(30000));
  });
}
