

import 'dart:convert';

import 'Cleric.dart';
import 'hero.dart';
import 'slime.dart';

void main (List<String> arguments) {

  // 가상 세계에 용사를 생성
  // 용사는 이름과 hp를 반드시 가져야 함
  Hero hero = Hero('용사', 100);

  // 슬라임 2마리 생성
  Slime slime1 = Slime(50, 'A');
  Slime slime2 = Slime(50, 'B');

  // 성직자 생성
  Cleric cleric = Cleric('성직자', 40, 5);

  // 공격, 도망, 잠자기 지시
  hero.attack();
  slime1.run();
  slime2.run();
  hero.run();
  hero.sleep();

  cleric.selfAid();
  cleric.selfAid();
}