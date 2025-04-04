// 기존 TangibleAsset 클래스 

// abstract class TangibleAsset {
//   String name;
//   int price;
//   String color;

//   TangibleAsset({required this.name, required this.price, required this.color});
// }

// 상속만 추가

// import 'asset.dart';

// abstract class TangibleAsset extends Asset {
//   String color;

//   TangibleAsset({
//     required super.name, 
//     required super.price, 
//     required this.color,
//     });
// }

// 인터페이스까지 추가

import 'asset.dart';
import 'book.dart';
import 'thing.dart';

abstract class TangibleAsset extends Asset implements Thing{
  String color;
  double _weight;

  TangibleAsset({
    required super.name, 
    required super.price, 
    required this.color,
    required double weight,
    }) : _weight = weight;

    @override
    double get weight => _weight;

    @override
    set weight(double value) {
      if (value >= 0) {
        _weight = value;
      } else {
        print('무게는 0 이상이어야 합니다!');
      }
  }
}

void main() {
  // Book 객체 생성
  Book myBook = Book(
    name: "Dart Programming",
    price: 29,
    color: "Blue",
    weight: 1.5,
    isbn: "123-456-789",
  );

  // 정보 출력
  print("Book Name: ${myBook.name}");
  print("Book Price: \$${myBook.price}");
  print("Book Color: ${myBook.color}");
  print("Book ISBN: ${myBook.isbn}");
  print("Book Weight: ${myBook.weight} kg");

  // 무게 업데이트
  myBook.weight = 2.0; // 무게 설정
  print("Updated Book Weight: ${myBook.weight} kg");

  // 잘못된 무게 설정 (음수로 설정)
  myBook.weight = -1.0; // "무게는 0 이상이어야 합니다." 출력
}