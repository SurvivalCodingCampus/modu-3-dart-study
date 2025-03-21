import 'package:modu_3_dart_study/2025-03-20/drawable.dart';

abstract class Moveable {
  void move(int seconds);
}

class Car implements Drawable, Moveable {
  final String brand;
  final String color;
  final int speed;

  Car(this.brand, this.color, this.speed);

  @override
  void draw() {
    // TODO: implement draw
    print('자동차를 그립니다.');
  }

  @override
  void move(int seconds) {
    // TODO: implement move
    final distance = speed * seconds;
    print('$brand 자동차가 ${distance}m 이동 했습니다.');
  }
}