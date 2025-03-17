import 'wand.dart';

class Wizard{
  String name;
  int hp;
  int mp;
  Wand? wand;

  Wizard({
    required this.name,
    required this.hp,
    required this.mp,
    this.wand,
  });

  // ----- wand -----
  Wand? get getWand{
    if(wand == null){
      throw Exception("$name의 완드가 없습니다.");
    }
    return wand;
  }
  set setWand(Wand value) => wand = value;

  // ----- mp -----
  set setMp(int value){
    // mp가 0보다 작아지면 에러
    if(value < 0){
      throw Exception("$name의 mp가 0보다 작습니다.");
    }
    mp = value;
  }
  
  // ----- hp -----
  set setHp(int value){
    // hp가 음수일시 0으로 설정
    if(value < 0){
      hp = 0;
      return;
    }
    hp = value;
  }
}