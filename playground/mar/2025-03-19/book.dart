import 'tangibleAsset.dart';

class Book extends TangibleAsset {
  String isbn;

  Book({
    required super.name,
    required super.price,
    required super.color,
    required this.isbn,
    required super.weight,
  });

  @override
  void identify() {
    print('제목 : $name, 가격 : $price원, 식별번호 : $isbn, 무게 : $weight g');
  }
}
