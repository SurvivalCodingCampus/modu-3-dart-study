import 'dart:math';

class Cleric {
  final int HP_MAX = 50;
  final int MP_MAX = 10;
  String name;
  int hp = 50;
  int mp = 10;
  int consume_mp = 5; //selfaid 마나 소비량

  Cleric(this.name){
    print('Cleric 생성 -> name:$name, hp:$hp, mp:$mp, HP_MAX:$HP_MAX, MP_MAX:${MP_MAX}');
  }

  void selfaid(){
    if(mp >= consume_mp){
      int hp_temp = hp;
      int mp_temp = mp;
      mp -= consume_mp;
      hp = HP_MAX;
      print("셀프에이드 성공: (hp:${hp_temp}->${HP_MAX}, mp:${mp_temp}->${mp})");
    }else{
      print("셀프에이드 실패: (마나 부족: hp:$hp, mp:$mp, 필요한 마나:${consume_mp-mp})");
    }
  }

  int pray(int second){
    if(second == 0) return 0;
    int random = second + Random().nextInt(3);
    int heal = min(MP_MAX, mp+random) - mp; //최종 회복량
    int mp_temp = mp;
    mp = min(MP_MAX, mp+random);
    print('기도하기 성공: (회복량:${random}, 실제회복량:${heal}) (hp:$hp, mp:$mp_temp->$mp)');
    return heal;
  }
}


void main() {
  Cleric cleric = Cleric('최윤석');
  cleric.selfaid();
  cleric.pray(1);
}