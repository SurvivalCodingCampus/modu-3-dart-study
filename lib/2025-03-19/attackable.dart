// 인터페이스
import 'package:modu_3_dart_study/2025-03-14/slime.dart';

abstract interface class ClassName {
  void speak();
}

abstract interface class Attackable {
  int get demage; //프로터티도 메서드의 일종
  void attack(Slime slime);
}
