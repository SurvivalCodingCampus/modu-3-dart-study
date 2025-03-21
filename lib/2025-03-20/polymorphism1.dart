// 추상 인터페이스 정의
abstract interface class Drawable {
  void draw();
}

// 각 클래스가 Drawable을 구현
class House implements Drawable {
  @override
  void draw() {
    print("집을 그립니다.");
  }
}

class Dog implements Drawable {
  @override
  void draw() {
    print("강아지를 그립니다.");
  }
}

// 각 클래스가 Drawable을 구현
class Rectangle implements Drawable {
  final int width;
  final int height;
  final String color;
  final String borderStyle;

  Rectangle({
    required this.width,
    required this.height,
    required this.color,
    required this.borderStyle,
  });

  @override
  void draw() {
    print("사각형을 그립니다.");
  }
}

class Car implements Drawable {
  @override
  void draw() {
    print("차를 그립니다.");
  }
}

void main() {
  // 단일 Drawable 요소 생성
  final Drawable element = House();
  element.draw();

  // Drawable 목록 생성
  final List<Drawable> elements = <Drawable>[Dog(), House(), Car()];

  // 동일한 draw() 호출, 그러나 실제 동작은 각 클래스에 따라 다름
  for (final element in elements) {
    element.draw();
  }

  final Drawable drawable = Rectangle(
    width: 100,
    height: 50,
    color: 'bule',
    borderStyle: 'dashed',
  );

  elements.add(drawable);

  switch (drawable) {
    case Rectangle():
      print('사각형임');
      break;
    case House():
      print('집임');
      break;
    case Dog():
      print('강아지임');
      break;
  }
}
