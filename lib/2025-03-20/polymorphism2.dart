// 추상 인터페이스 정의
abstract interface class Drawable {
  void draw();
}

// 추상 클래스 정의
abstract class Moveable {
  void move(int second);
}

class Car implements Drawable, Moveable {
  final int speed;
  final String brand;
  final String color;

  Car({required this.speed, required this.color, required this.brand});

  @override
  void draw() {
    print("자동차를 그립니다.");
  }

  @override
  void move(int seconds) {
    final distance = speed * seconds;
    print('$brand 자동차가 ${distance}m 이동했습니다.');
  }
}

void main() {
  final Moveable car = Car(speed: 100, brand: 'BMW', color: 'Red');
  // car.draw();
  car.move(5);

  final Drawable car2 = Car(speed: 100, brand: 'BMW', color: 'Red');
  car2.draw();
  // car2.move(5);
}
