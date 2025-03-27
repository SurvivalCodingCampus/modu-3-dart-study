import 'package:collection/collection.dart';
import 'package:test/test.dart';

void main() {
  int numberOfTwitter = 4;

  Future<int> bird(String message, int second) async {
    int result = 0;
    for (int i = 0; i < numberOfTwitter; i++) {
      print(message);
      result++;
      await Future.delayed(Duration(seconds: second));
    }
    return result;
  }

  test('새가 4번씩 우는지 테스트', () async {
    final twitterList = await Future.wait([
      bird('꾸우', 1),
      bird('까악', 2),
      bird('짹짹', 3),
    ]);
    expect(
      ListEquality().equals(twitterList, [
        numberOfTwitter,
        numberOfTwitter,
        numberOfTwitter,
      ]),
      isTrue,
    );
  });
  
 
}
