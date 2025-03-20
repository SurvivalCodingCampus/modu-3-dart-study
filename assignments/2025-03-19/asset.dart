abstract class Asset {
  final String _name;
  final String _createdDate;
  String manageDepart;
  String description;

  Asset(this._name, this._createdDate, this.manageDepart, this.description);

  String get name => _name;
  String get createdDate => _createdDate;

  int calculateTax();
}

abstract class TangibleAsset extends Asset implements Thing {
  int price;
  String color;
  DateTime purchaseDate;

  TangibleAsset(
    String name,
    String createdDate,
    String manageDepart,
    String description,
    this.price,
    this.color,
    this.purchaseDate,
  ) : super(name, createdDate, manageDepart, description);

  //필수는 아님, 상속받은 클래스에서 구현하면 됨.
  //@override
  //double get weight;
  //@override
  // int calculateTax();
}

class Computer extends TangibleAsset {
  String makerName;

  Computer(
    String name,
    String createdDate,
    String manageDepart,
    String description,
    int price,
    String color,
    DateTime purchaseDate,
    this.makerName,
  ) : super(
        name,
        createdDate,
        manageDepart,
        description,
        price,
        color,
        purchaseDate,
      );

  @override
  double get weight => 100.0;

  @override
  int calculateTax() {
    return (price * 0.08).toInt(); // 8%세금가정
  }
}

class Book extends TangibleAsset {
  String isbn;

  Book(
    String name,
    String createdDate,
    String manageDepart,
    String description,
    int price,
    String color,
    DateTime purchaseDate,
    this.isbn,
  ) : super(
        name,
        createdDate,
        manageDepart,
        description,
        price,
        color,
        purchaseDate,
      );

  @override
  double get weight => 50.0;

  @override
  int calculateTax() {
    return (price * 0.01).toInt(); // 1% 세금 가정
  }
}

abstract interface class Thing {
  double get weight;
}

//자산인지 아닌지 따지지 말고, 인터페이스 Thing 만들기
//형태가 있는 것 Thing 이면 무게가 있다. -> 유형자산 double 으로 weight을 얻을 수 있도록 getter/setter(프로퍼티도 메서드의 일종)
//int get weight;  추상 프로퍼티
