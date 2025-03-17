void main() {
  Hero2 hero2 = Hero2(name: "test", hp: 100);
}

class Hero2 {
  String name;
  int _hp;

  Hero2({required this.name, required int hp}) : _hp = hp;

  // 화살표 함수로 간단히 표현 가능
  // getter 외부에서는 상수로 표현 가능
  int get hp => _hp;

  set hp(int value) {
    _hp = value;
  }
}
