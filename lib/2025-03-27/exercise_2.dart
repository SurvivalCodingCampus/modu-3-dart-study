import 'dart:async';

abstract interface class Bird {
  Future<void> makeSound();
}

class Bird1 implements Bird {
  @override
  Future<void> makeSound() {
    return Future.delayed(Duration(seconds: 1), () {
      print('꾸우');
    });
  }
}

class Bird2 implements Bird {
  @override
  Future<void> makeSound() {
    return Future.delayed(Duration(seconds: 2), () {
      print('까악');
    });
  }
}

class Bird3 implements Bird {
  @override
  Future<void> makeSound() {
    return Future.delayed(Duration(seconds: 3), () {
      print('짹짹');
    });
  }
}

void main() async {
  List<Bird> birds = [Bird1(), Bird2(), Bird3()];

  for (int i = 0; i < 4; i++) {
    birds.forEach((bird) => bird.makeSound());
    await Future.delayed(Duration(milliseconds: 1000));
  }

}
