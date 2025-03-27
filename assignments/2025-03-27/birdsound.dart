Future<void> birdSound(String sound, int interval) async {
  for (int i = 0; i < 4; i++) {
    await Future.delayed(Duration(seconds: interval));
    print(sound);
  }
}

Future<void> main() async {
  await Future.wait([
    birdSound("꾸우", 1),
    birdSound("까악", 2),
    birdSound("짹짹", 3),
  ]);

  print("모든 새소리가 끝났습니다.");
}

// 3번 문제

// import 'dart:async';

// void birdSound(String sound, int interval, List<Timer> timers) {
//   Timer timer = Timer.periodic(Duration(seconds: interval), (_) {
//     print(sound);
//   });

//   // 타이머 리스트에 추가하여 나중에 모두 취소할 수 있도록 함
//   timers.add(timer);
// }

// Future<void> main() async {
//   List<Timer> timers = [];

//   birdSound("꾸우", 1, timers);
//   birdSound("까악", 2, timers);
//   birdSound("짹짹", 3, timers);

//   // 10초 후에 모든 타이머를 정리하고 프로그램 종료
//   await Future.delayed(Duration(seconds: 10), () {
//     for (var timer in timers) {
//       timer.cancel();
//     }
//     print("창문을 닫고 하루를 시작합니다.");    
//   }); 
// }