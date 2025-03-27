import 'package:collection/collection.dart';
import 'package:test/test.dart';

void main() {
  int seconds = 4;

  Future<int> bird(String message, int second) async {
    while (true) {
      print(message);

      await Future.delayed(Duration(seconds: second));
    }
  }

  bool isTwit = true;

  Future<int> bird2(String message, int second) async {
    int result = 0;
    while (isTwit) {
      print(message);
      await Future.delayed(Duration(seconds: second));
      result += second;
    }
    return result;
  }

  test('새가 $seconds초만큼 우는지 테스트 with doWhile', () async {
    await Future.doWhile(() async {
      bool isTwitter = true;
      final list = Future.wait([bird('꾸우', 1), bird('까악', 2), bird('짹짹', 3)]);
      await Future.delayed(Duration(seconds: seconds));
      expect(list, isA<Future<List<int>>>());
      isTwitter = false;
      return isTwitter == true;
    });
  });
  test('새가 $seconds초만큼 우는지 테스트 without doWhile ', () async {
    isTwit = true;

    final twitterList = Future.wait([
      bird2('꾸우', 1),
      bird2('까악', 2),
      bird2('짹짹', 3),
    ]);
    // await Future.delayed(Duration(seconds: seconds));
    await Future.delayed(
      Duration(seconds: seconds),
      () => print('$seconds초가 지났습니다.'),
    );
    isTwit = false;
    // print(await twitterList);
    final result = await twitterList;
    // print(
    //   'result : $result, 비교 : ${[seconds, (seconds / 2).ceil() * 2, (seconds / 3).ceil() * 3]}',
    // );
    expect(
      ListEquality().equals(result, [
        seconds,
        (seconds / 2).ceil() * 2,
        (seconds / 3).ceil() * 3,
      ]),
      isTrue,
    );
  });
}
