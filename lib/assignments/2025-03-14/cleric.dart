import 'dart:math';

class Cleric {
  // 필드 (속성값)
  String name;
  int hp;
  int mp;

  /* final */
  // 런타임에 실행이 되므로, 네임드 생성자로 만 가능
  // 기본 생성자로는 초기화값을 찾지 못해서 안됨.
  // static final int maxHp = 50;
  // static final int maxMp = 10;

  /* const */
  // 컴파일과 동시에 최기화 됨
  static const int maxHp = 50;
  static const int maxMp = 10;

  /* 생성자 */
  // 1) 기본생성자 - name, hp, mp 지정
  // Cleric({required this.name, required this.hp, required this.mp}) {
  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp}) {
    print('🎉🎮 [캐릭터 탄생] 🎮🎉');
    print('--------------------------------------');
    print('✨ 이름: $name');
    print('✨ 체력: $hp / $maxHp');
    print('✨ 마나: $mp / $maxMp');
    print('--------------------------------------');
    print('⚔️ 당신의 모험이 이제 시작됩니다, $name! ⚔️');
    print('--------------------------------------');
  }

  /* 네임드 생성자 */
  // 네임드 생성자를 사용하는 경우
  // => 기본 생성자 이외의 다른 이름의 생성자를 만들때 사용
  // => 객체의 종류를 지정해 주고 싶을 때 사용
  // 그러나, 이번 문제에서는 네임드 생성자가 절절하지 않음!!!!!
  // 네임드 파라미터 쓰시길.

  // //------------- 주석 있어여~

  // // 2) Cleric (name:'낄낄', hp: 30) -> mp는 기본 값을 따름!
  // // name과 hp만 지정하는 네임드 생성자 mp 기본값 maxMp
  // Cleric.withNameAndHp(String name, int hp)
  //   : this(name: name, hp: hp, mp: maxMp); // 런타임 생성자

  // // 3) 이름만 지정하는 네임드 생성자 -> HP와 MP 기본값은 maxHp, maxMp
  // Cleric.withName(String name) : this(name: name, hp: maxHp, mp: maxMp);

  // mp로 hp 최대로 회복하기
  void selfAid() {
    // if (hp == maxHp) {
    //   print('✨ 체력이 이미 최대치입니다! [셀프에이드]를 사용할 필요가 없습니다.');
    //   return;
    // }
    print('--------------------------------------');
    print('🧪 [셀프에이드] 마법 준비 중...');

    if (mp < 5) {
      print('💥 마나가 부족하여 [셀프에이드]에 실패했습니다. 마나가 $mp 남았습니다.');
      print('⚠️ 마나를 회복하거나 마법을 사용하기 전에 마나를 확인하세요!');
    } else {
      mp -= 5;
      hp = maxHp;
      print('💫 마법 발동! 체력이 최대치인 $maxHp로 회복되었습니다! 🎉');
      print('💠 마나 5를 소모했습니다. 남은 마나: $mp');
      print('--------------------------------------');
    }
  }

  // 기도 시간에 따라 mp회복하기
  int pray(int second) {
    final Random random = Random();

    int recoveryAmount = second + random.nextInt(3); // 0~2 랜덤 값

    //            기도시간 + 램덤 값, 최대MP - 남은MP = 추가가능한 mp
    recoveryAmount = min(recoveryAmount, maxMp - mp);

    mp += recoveryAmount; // 실제 MP 회복

    print('--------------------------------------');
    print('⛪ [기도] $second 초 동안 기도하며 마나를 회복 중...');
    print('✨ 기도 후, 실제 회복된 마나: $recoveryAmount');
    print('💠 현재 마나: $mp / $maxMp');

    if (mp == maxMp) {
      print('💥 마나가 가득 찼습니다! 더 이상 기도할 필요가 없습니다.');
    }
    print('--------------------------------------');

    return recoveryAmount;
  }
}
