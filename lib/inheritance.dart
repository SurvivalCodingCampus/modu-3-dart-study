abstract class Asset {
  final String _name;
  final String _createdDate;
  final String _manageDepart; // 관리부서
  final String _description; // 설명

  Asset({
    required String name,
    required String createdDate,
    required String manageDepart,
    required String description,
  }) : _name = name,
        _createdDate = createdDate,
        _manageDepart = manageDepart,
        _description = description;

  String get name => _name;

  String get createdDate => _createdDate;

  String get manageDepart => _manageDepart;

  String get description => _description;

  // 모든 자산이 가져야 할 기능
  int calculateTax(); // 세금 계산

  void transact(); // 거래

  void dispose(); // 폐기
}

abstract interface class Thing {
  double get weight;
  set weight(double value);
}

abstract class TangibleAsset extends Asset implements Thing {
  int price;
  String color;
  DateTime purchaseDate;
  double salvageValue; // 잔존가치

  TangibleAsset({
    required this.price,
    required this.color,
    required this.purchaseDate,
    required this.salvageValue,
    required super.name,
    required super.createdDate,
    required super.manageDepart,
    required super.description,
    double weight = 0.0,
  });

  double calculateDepreciation(int years) {
    if (years <= 0) return 0.0; // 음수 방지
    return (price - salvageValue) / years;
  }

  @override
  void dispose() {
    print("처분 완료");
  }

  @override
  void transact() {
    print("거래 완료");
  }
}

class Book extends TangibleAsset {
  String isbn;

  Book({
    required this.isbn,
    required super.price,
    required super.color,
    required super.purchaseDate,
    required super.salvageValue,
    required super.name,
    required super.createdDate,
    required super.manageDepart,
    required super.description,
    super.weight
  });

  @override
  double weight = 100.0;

  @override
  int calculateTax() {
    return (price * 0.05).toInt();
  }
}

class Computer extends TangibleAsset {
  String makerName;
  double _weight;

  Computer({
    required this.makerName,
    required super.name,
    required super.price,
    required super.color,
    required super.purchaseDate,
    required super.salvageValue,
    required super.createdDate,
    required super.manageDepart,
    required super.description,
    required double weight,
  }) : _weight = weight;

  @override
  // TODO: implement weight
  double get weight => _weight;

  @override
  set weight(double value) => _weight = value;

  @override
  int calculateTax() {
    return (price * 0.1).toInt();
  }
}

abstract class IntangibleAsset extends Asset {
  IntangibleAsset({
    required super.name,
    required super.createdDate,
    required super.manageDepart,
    required super.description,
  });

  @override
  void dispose() {
    print("처분 완료");
  }

  @override
  void transact() {
    print("거래 완료");
  }
}

class Patent extends IntangibleAsset {
  String patentNumber;

  Patent({
    required this.patentNumber,
    required super.name,
    required super.createdDate,
    required super.manageDepart,
    required super.description,
  });

  @override
  int calculateTax() {
    return 100000;
  }
}