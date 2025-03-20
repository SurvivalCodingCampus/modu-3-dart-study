import 'exercise_3.dart';

void main() {
  Computer computer = Computer('갠역시', 10000, 'black', 100, '삼성');
  computer.weight = 1;

}

class Computer extends TangibleAsset {
  String makeName;

  Computer(super.name, super.price, super.color, super.size, this.makeName);

  @override
  set weight(double value){
    _weight = value;
    print('$name의 무게는 $_weight 이다');
  }

  @override
  double get weight => _weight;

  @override
  void learn() {
    // TODO: implement learn
    super.learn();
    print('$name에서 배우다.');
  }
  @override
  void look() {
    // TODO: implement look
    super.look();
    print('$name의 상표는 $makeName이다');
  }

}

abstract class TangibleAsset extends Asset implements Thing {
  double size;
  double _weight = 1;

  TangibleAsset(super.name, super.price, super.color, this.size);

  @override
  double get weight => _weight;

  @override
  set weight(double value) {
    _weight = value;
    print('$size의 무게 $_weight');
  }

  void learn() {
    print('$name을 배우다');
  }

  @override
  void look() {
    super.look();
    print('$name의 색상은 $color이며, 가격은 $price이다.');
  }
}

abstract class Asset {
  String name;
  int price;
  String color;

  Asset(this.name, this.price, this.color);

  void look() {
    print('$name 을 보다');
  }
}
