import 'dart:async';

class Bird {
  final String sound;
  final int interval; // 소리의 간격 (초 단위)
  final int targetTime; // 종료 시간 (초 단위)
  final int _defaultCount = 4; //기본용

  Bird({required this.sound, required this.interval, required this.targetTime});

  Future<void> basicTime() async {
    int count = 0;
    while (count < _defaultCount) {
      await Future.delayed(Duration(seconds: interval));
      print('$sound새 : $sound!!!');
      count++;
    }
    print('[$sound새님이 나가셨습니다.  / 채팅 기록 : $count 회]');
  }

  // targetTime 내에 정확히 종료되도록 반복
  Future<void> repeatUntilTime() async {
    // targetTime에 맞춰 반복 횟수를 계산
    int count = 0;

    int repeatCount = targetTime ~/ interval;

    for (int i = 0; i < repeatCount; i++) {
      await Future.delayed(Duration(seconds: interval)); // interval 간격으로 딜레이
      print('$sound새 : $sound!!!');
      count++;
    }
    print('[$sound새님이 나가셨습니다. / 채팅 기록 : $count 회]');
  }

}

class Abc{

}

void main() async {}
