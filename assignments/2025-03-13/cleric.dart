import 'dart:math';

class Cleric {
  // 필드 (속성값)
  String name;
  int hp = 50;
  final int maxHp = 50;
  int mp = 10;
  final int maxMp = 10;

  // 생성자
  Cleric(this.name) {
    print('🎉🎮 [캐릭터 탄생] 🎮🎉');
    print('--------------------------------------');
    print('✨ 이름: $name');
    print('✨ 체력: $hp / $maxHp');
    print('✨ 마나: $mp / $maxMp');
    print('--------------------------------------');
    print('⚔️ 당신의 모험이 이제 시작됩니다, $name! ⚔️');
    print('--------------------------------------');
  }

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

    // 기도 시간에 따라 회복량 결정 (0 ~ 2 보정값 추가)
    int recoveryAmount = second + random.nextInt(3); // 0~2 사이의 랜덤 값 추가

    // 최대 MP보다 회복량이 많지 않도록 제한
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
