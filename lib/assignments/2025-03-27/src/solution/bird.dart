// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

// abstract class Bird {
//   final String name;
//   final String sound;
//   int soundCount = 0;
//   int delay = 1; // 각 새의 우는 타이밍

//   Bird(this.name, this.sound);

//   Future<void> makeSound(int currentTime) async {
//     if (soundCount < 4 && currentTime % delay == 0) {
//       print(sound);
//     }
//   }
// }

abstract class Bird {
  final String name;
  final String sound;

  Bird(this.name, this.sound);

  Future<void> makeSound();
}

class Bird1 extends Bird {
  List<String> sounds = []; // 원하는 횟수만큼 들어가는지 확인
  Bird1(super.name, super.sound);

  @override
  Future<void> makeSound() async {
    for (int i = 0; i < 4; i++) {
      await Future.delayed(Duration(seconds: 1));
      sounds.add(sound);
      print(sound);
    }
    /*for (;;) { // 무한루프
      await Future.delayed(Duration(seconds: 1));
      print(sound);
    }*/
  }
}

class Bird2 extends Bird {
  List<String> sounds = [];
  Bird2(super.name, super.sound);

  @override
  Future<void> makeSound() async {
    for (int i = 0; i < 4; i++) {
      await Future.delayed(Duration(seconds: 2));
      sounds.add(sound);
      print(sound);
    }
    // for (;;) { // 무한루프
    //   await Future.delayed(Duration(seconds: 2));
    //   print(sound);
    // }
  }
}

class Bird3 extends Bird {
  List<String> sounds = [];
  Bird3(super.name, super.sound);

  @override
  Future<void> makeSound() async {
    for (int i = 0; i < 4; i++) {
      await Future.delayed(Duration(seconds: 3));
      sounds.add(sound);
      print(sound);
    }

    // for (;;) { // 무한루프
    //   await Future.delayed(Duration(seconds: 3));
    //   print(sound);
    // }
  }
}

void main() async {
  final bird1 = Bird1("새1", "꾸우");
  final bird2 = Bird2("새2", "까악");
  final bird3 = Bird3("새3", "짹짹");

  final sounds = [bird1.makeSound(), bird2.makeSound(), bird3.makeSound()];
  await Future.wait(sounds);

  print(bird1.sounds);
  print(bird2.sounds);
  print(bird3.sounds);
  // void exercise2() async {
  //   Timer(Duration(seconds: 10), () {
  //     print('10초 경과. 프로그램을 종료합니다.');
  //     exit(0);
  //   });

  //   await Future.wait([
  //     bird1.makeSound(1),
  //     bird2.makeSound(2),
  //     bird3.makeSound(3),
  //   ]);
  // }
}
