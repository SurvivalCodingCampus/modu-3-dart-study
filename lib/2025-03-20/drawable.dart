abstract interface class Drawable {
  void draw();
}

class Tree implements Drawable {
  double height;

  Tree({required this.height});

  @override
  void draw() {
    // TODO: implement draw
  }
}

class House implements Drawable {
  String address;
  int size;
  String color;

  House({required this.address, required this.size, required this.color});

  @override
  void draw() {
    print('집을 그리다.');
  }
}

class Dog implements Drawable {
  String name;
  int age;

  Dog({required this.name, required this.age});

  @override
  void draw() {
    // TODO: implement draw
    print('개를 그리다');
  }
}

class Rectangle implements Drawable {
  int width;
  int height;
  String color;
  String borderStyle;

  Rectangle({
    required this.width,
    required this.height,
    required this.color,
    required this.borderStyle,
  });

  @override
  void draw() {
    // TODO: implement draw
  }
}
