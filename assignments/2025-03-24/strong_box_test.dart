import 'package:test/test.dart';
import 'strong_box.dart';

void testStrongBox() {
  StrongBox box = StrongBox<String>(KeyType.padlock);
  box.put('SECRET');

  String? result;

  for (int i = 1; i < box.maxTry; i++) {
    result = box.get();
    if (result != null) {
      print('실패: $i번째 호출에서 금고가 열렸습니다.');
      return;
    }
  }

  result = box.get();
  if (result == 'TOP SECRET') {
    print('성공: ${box.maxTry}번째 호출에서 금고가 열렸습니다.');
  } else {
    print('실패: ${box.maxTry}번째 호출에서도 금고가 열리지 않았습니다.');
  }
}

void main() {
  testStrongBox();
}
