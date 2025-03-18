class Shape {
  void draw(){
    print("도형을 그립니다.");
  }
}

class Circle extends Shape {
  @override
  void draw() {
    print("원을 그립니다.");
  }
}

void main(){
  Shape shape = Shape();
  shape.draw();

  Circle circle = Circle();
  circle.draw();
}