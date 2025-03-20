import 'package:test/test.dart';  
import '../../assignments/2025-03-19/book.dart';
import '../../assignments/2025-03-19/computer.dart';

void main() {
  // Book 테스트
  test('Book: Weight should be 0 or more', () {
    var book = Book(
      name: 'Dart Programming',
      price: 29,
      color: 'Blue',
      weight: 1.5,
      isbn: '123-456-789',
    );

    // 정상적인 무게 설정
    expect(book.weight, 1.5);

    // 무게를 음수로 설정
    book.weight = -1.0;  // 이때 "무게는 0 이상이어야 합니다!"가 출력되어야 함
    expect(book.weight, 1.5);  // 무게는 여전히 1.5이어야 함
  });

  // Computer 테스트
  test('Computer: Weight should be 0 or more', () {
    var computer = Computer(
      name: 'MacBook Pro',
      price: 2500,
      color: 'Silver',
      makerName: 'Apple',
      weight: 2.0,
    );

    // 정상적인 무게 설정
    expect(computer.weight, 2.0);

    // 무게를 음수로 설정
    computer.weight = -1.0;  // 이때 "무게는 0 이상이어야 합니다!"가 출력되어야 함
    expect(computer.weight, 2.0);  // 무게는 여전히 2.0이어야 함
  });
}