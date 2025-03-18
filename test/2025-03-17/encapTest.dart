import 'package:test/test.dart';
import '../../assignments/2025-03-17/encapsulation.dart';

void main() {
  try {
    Wand wand = Wand(name: "Elder Wand", power: 50.0);
    Wizard wizard = Wizard(name: "Gandalf", mp: 100, hp: 80, wand: wand);

    print("마법사: ${wizard.name}, HP: ${wizard.hp}, MP: ${wizard.mp}, 지팡이: ${wizard.wand.name}");

    // 잘못된 데이터 테스트 (이름이 3자 미만일 경우 예외 발생)
    wizard.name = "Al";
  } catch (e) {
    print("오류 발생: $e");
  }
}