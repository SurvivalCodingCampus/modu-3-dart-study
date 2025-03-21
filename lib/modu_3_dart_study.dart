class Modu3DartStudy {}

abstract class Monster {
  void run();
}

class Slime extends Monster {
  @override
  void run() {
    print('슬라임이 뛰었다 !');
  }

  void jump() {
    print('슬라임이 점프했다 !');
  }
}

class Dragon extends Monster {
  @override
  void run() {
    print('드래곤이 뛰었다 !');
  }
}

void main() {
  Monster monster = Slime();

  if (monster is Slime) {
    print('타입이 맞다 !');
  }
  if (monster is Dragon) {
    print('타입이 틀렸다');
  }
  // monster as Slime;

  print(monster.runtimeType);
  // monster.jump();
  monster.run();
}
