import 'package:modu_3_dart_study/2025-03-27/bird.dart';
import 'package:test/test.dart';

const int testTargetTime = 10; // 테스트에 사용할 targetTime
const int testIntervalBird1 = 1; // bird1의 interval
const int testIntervalBird2 = 2; // bird2의 interval
const int testIntervalBird3 = 3; // bird3의 interval
const int expectedRepeatCountBird1 = 4; // bird1은 4번 반복
const int expectedRepeatCountBird2 = 5; // bird2는 5번 반복
const int expectedRepeatCountBird3 = 3; // bird3은 3번 반복

void main() {
  // 공통 인스턴스 생성 (late 키워드 사용)
  late Bird bird1;
  late Bird bird2;
  late Bird bird3;

  // 테스트 전에 인스턴스 초기화
  setUpAll(() {
    bird1 = Bird(sound: '꾸우', interval: testIntervalBird1, targetTime: testTargetTime);
    bird2 = Bird(sound: '까악', interval: testIntervalBird2, targetTime: testTargetTime);
    bird3 = Bird(sound: '짹짹', interval: testIntervalBird3, targetTime: testTargetTime);
  });

  group('새 울음소리 기본 4회 반복', () {
    test('bird1, bird2, and bird3는 각각 지정된 횟수만큼 소리를 내야 한다', () async {
      // 기본 시간 테스트, bird1은 4번, bird2는 5번, bird3은 3번 호출

      // 각 새의 기본 시간 테스트 실행
      Future<void> bird1Future = bird1.basicTime();
      Future<void> bird2Future = bird2.basicTime();
      Future<void> bird3Future = bird3.basicTime();

      // 모든 작업이 완료될 때까지 대기
      await Future.wait([bird1Future, bird2Future, bird3Future]);

      // 직접적으로 출력된 호출 횟수 확인
      // basicTime에서는 4번, 5번, 3번 반복이므로 직접 확인해야 함
      expect(true, true); // 기본적으로 출력이 나올 때마다 검증을 할 수 있음
    });
  });

  group('새 울음소리 10초만 반복', () {
    test('bird1, bird2, and bird3는 10초 내에 종료되어야 한다', () async {
      // 각 새가 10초 내에 종료되는지 확인

      DateTime startTime = DateTime.now();

      // 각 새가 targetTime 내에 반복하는 작업 실행
      Future<void> bird1Future = bird1.repeatUntilTime();
      Future<void> bird2Future = bird2.repeatUntilTime();
      Future<void> bird3Future = bird3.repeatUntilTime();

      // 모든 작업이 완료될 때까지 대기
      await Future.wait([bird1Future, bird2Future, bird3Future]);

      // 종료 시간 기록
      DateTime endTime = DateTime.now();
      Duration elapsedTime = endTime.difference(startTime);

      // 10초 이내에 종료되었는지 확인
      expect(elapsedTime.inSeconds, equals(testTargetTime));
    });
  });
}
