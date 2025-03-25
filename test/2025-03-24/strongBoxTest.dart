import 'package:modu_3_dart_study/2025-03-24/strongBox.dart';
import 'package:test/test.dart';

class User {
  String name;

  User(this.name);
}

void main() {
  group("String 타입 저장 및 가져오기", () {
    test("put으로 여러 타입 저장 후 꺼내기", () {
      StrongBox<String> strongBoxStr = StrongBox();
      StrongBox<int> strongBoxInt = StrongBox();
      StrongBox<User> strongBoxUser = StrongBox();

      const targetString = "Hello Dart";
      const targetInt = 123456;
      User targetUser = User("Alice");

      //실행
      strongBoxStr.put(targetString);
      strongBoxInt.put(targetInt);
      strongBoxUser.put(targetUser);

      //검증
      expect(strongBoxStr.get(), targetString);
      expect(strongBoxInt.get(), targetInt);
      expect(strongBoxUser.get(), targetUser);
    });

    test("put으로 여러 타입 저장 후 타입 캐스팅 테스트", () {
      StrongBox<String> strongBoxStr = StrongBox();
      StrongBox<int> strongBoxInt = StrongBox();
      StrongBox<User> strongBoxUser = StrongBox();

      const targetString = "Hello Dart";
      const targetInt = 123456;
      User targetUser = User("Alice");

      //실행
      strongBoxStr.put(targetString);
      strongBoxInt.put(targetInt);
      strongBoxUser.put(targetUser);

      //검증
      expect(strongBoxStr.get().length, targetString.length);
      expect(strongBoxInt.get() + 10, targetInt + 10);
      expect(strongBoxUser.get().name, targetUser.name);
    });
  });
}
