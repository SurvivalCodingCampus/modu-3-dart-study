import 'dart:async';

abstract class Bird {
  Future<String> makeSound();
}

class Bird1 implements Bird {
  @override
  Future<String> makeSound() {
    return Future.delayed(Duration(seconds: 1), () => '꾸우');
  }
}

class Bird2 implements Bird {
  @override
  Future<String> makeSound() {
    return Future.delayed(Duration(seconds: 2), () => '까악');
  }
}

class Bird3 implements Bird {
  @override
  Future<String> makeSound() {
    return Future.delayed(Duration(seconds: 3), () => '짹짹');

  }
}

void main() async {
  List<Bird> birds = [Bird1(), Bird2(), Bird3()];

  for (int i = 0; i < 4; i++) {
    birds.forEach((bird) => bird.makeSound());
    await Future.delayed(Duration(milliseconds: 1000));
  }
}
