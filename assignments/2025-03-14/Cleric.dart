import 'dart:math';

class Cleric {
  static const int maxHP = 50;
  static const int maxMP = 10;
  String name;
  int hp;
  int mp;
  Cleric (this.name, {this.hp = maxHP, this.mp = maxMP}){
    print('Cleric 생성 -> name:$name, hp:$hp, mp:$mp, HP_MAX:$maxHP, MP_MAX:$maxMP');
  }

  void selfAid(){
    if(mp >= 5){
      mp -= 5;
      hp = maxHP;
      print("셀프에이드 성공: (hp:$hp, mp:${mp})");
    }else{
      print("셀프에이드 실패: (마나 부족: hp:$hp, mp:$mp, 필요한 마나:${5-mp})");
    }
  }

  int pray(int second){
    if(second <= 0) return 0;
    int heal = second + Random().nextInt(3);
    int totalHeal = min(maxMP, mp + heal) - mp; //실제 회복량
    mp = min(maxMP, mp + heal);
    print('기도하기 성공: (hp:$hp, mp:$mp) 실제회복량:$totalHeal');
    return heal;
  }
}


void main() {
  Cleric c1 = Cleric('최윤석', hp: 40, mp: 5);
  Cleric c2 = Cleric('최윤석', hp: 35);
  Cleric c3 = Cleric('최윤석');
}