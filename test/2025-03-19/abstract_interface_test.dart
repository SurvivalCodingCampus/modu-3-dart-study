import 'package:test/test.dart';

import '../../assignments/2025-03-19/book.dart';
import '../../assignments/2025-03-19/computer.dart';

void main() {
  String bookName = '생존코딩';
  int bookPrice = 50000;
  String bookColor = 'blue';
  double bookWeight = 523.15;
  String bookIsbn = 'ISBN';

  String comName = '맥스튜디오';
  int comPrice = 25000000;
  String comColor = 'spaceGray';
  double comWeight = 1523.4;
  String comMakerName = 'apple';

  double newBookWeight = 523.235;
  double newComWeight = 2214.7;

  test('자산 무게 측정', () {
    //given
    Book book = Book(bookName, bookPrice, bookColor, bookWeight, bookIsbn);
    Computer computer = Computer(
      comName,
      comPrice,
      comColor,
      comWeight,
      comMakerName,
    );

    //when
    print(book.weight);
    print(computer.weight);
    book.weight = newBookWeight;
    computer.weight = newComWeight;

    //then
    expect(book.weight, equals(newBookWeight));
    expect(computer.weight, equals(newComWeight));
  });
}
