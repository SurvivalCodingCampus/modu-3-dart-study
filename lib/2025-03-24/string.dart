import 'package:modu_3_dart_study/2025-03-14/hero.dart';

void main() {
  // 문자열 처리 결합
  print('문자열 처리결합: ${'Hello' + ' Dart'}');
  print('수식을 활용한 결합: ${3 + 2}'); // 5
  print('수식을 활용한 결합: ${'word'.toUpperCase()}'); // WORD

  print('\n');
  print('<<문자열처리>>');
  print('substring 일부 떼기 : ${'Hello'.substring(0, 2)}'); // He
  print(
    'replaceAll 일부 치환 : ${'Hello'.replaceAll('ll', 'xx')}',
  ); // Hexxo -> 대소문자는 구분함

  print('split 분리 : ${'1,2,3'.split(',')}'); // [1, 2, 3]
  print('toLowerCase 대소문자변경 : ${'HELLO'.toLowerCase()}'); // hello
  print('indexOf 검색 : ${'HELLO'.indexOf('E')}'); // 1
  print('대소문자 내용비교 :${'Dart'.toLowerCase() == 'dart'.toLowerCase()}'); // ture
  // 대소문자를 구분하니 주의!
  print('length 문자열 길이 : ${'Dart'.length}'); // 4
  print('isEmpty 길이가 0인가 : ${'Dart'.isEmpty}'); // false
  print('contains 포함관계: ${'Dart and Flutter'.contains('Flutter')}'); // ture
  print('endsWith 끝나는단어: ${'Dart and Flutter'.endsWith('Flutter')}'); // ture
  print('indexOf 위치: ${'Dart and Flutter'.indexOf('t')}'); // 3
  print(
    'lastIndexOf 뒤에서 몇번째 위치 : ${'Dart and Flutter'.lastIndexOf('t')}',
  ); // 13 첫번째 t
  print(
    'toUpperCase 대문자 : ${'Dart and Flutter'}'.toUpperCase(),
  ); // DART AND FLUTTER
  print(
    'toLowerCase 소문자 : ${'Dart and Flutter'}'.toLowerCase(),
  ); // dart and flutter
  print('trim 좌우공백제거 : ${'        Dart and Flutter         '.trim()}');
  print('\n');
  print('<<문자열 결합방법>>');
  // 1) + 연산 -> (느림) String은 불변의 객체 immutable
  // 2) String interpolation -> ${} or $
  // 3) StringBuffer
  //     -> (빠름) write() 메서드로 결합한 결과를 내부 메모리(버퍼)에 담아 두고 toString()으로 결과를 얻음
  final buffer = StringBuffer('Dart');
  buffer.write(' and ');
  buffer.write('Flutter');
  print('StringBuffer : $buffer'); // Dart and Flutter

  print('\n');
  print('\n');
  print('<<인스턴스 비교>>');
  Hero hero1 = Hero(name: '홍길동', hp: 5);
  Hero hero2 = Hero(name: '홍길동', hp: 5);
  print(identical(hero1, hero2)); // false

  String str1 = 'hello';
  String str2 = 'hello';
  print(identical(str1, str2)); // true
  // 컴파일 시점에서 동일한 문자를 재사용하기 위해 마련된 메모리 공간
  // Spring Pool 에 저장한다.

  String str3 = String.fromCharCodes('hello'.codeUnits); // 유니코드로 변환후 다시 String
  print(identical(str1, str3)); // flase
  // String Pool에 저장되지 않는 이유는 런타임(runtime)에 문자열이 생성되기 때문
  // 동적으로 생성된 문자열

  const String str4 = 'hel' + 'lo'; // 인스턴스가 2개이상
  print(identical(str1, str4));
  // const 면 true
  // 안적거나 final 이면 false

  String str5 = 'hel' + getLo();
  print(identical(str1, str5));
  // const 면 true
  // 안적거나 final 이면 false

  int luckyNumber1 = 13;
  int luckyNumber2 = luckyNumber1;
  luckyNumber2 = 12;

  print(luckyNumber1); // 13
  print(luckyNumber2); // 12
  // 값 타입 : int, double, bool 값 복사가 일어나며, 변수들은 독립적으로 동작
  // 참조 타입 : 스트(List), 맵(Map), 사용자 정의 클래스와 같은 객체는 참조 타입
  //    -> 메모리 주소 참조로 복사되기 때문에 다른 변수에 영향을 줌
}

String getLo() {
  return 'lo';
}
