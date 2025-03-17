void main() {
  Hero2 hero2 = Hero2(name: 'name', healPoint: 100);
  print(hero2.hp);

  hero2.hp = 200;
  print(hero2.hp);
}

class Hero2 {
  String name;
  int _hp;

  //getter
  int get hp => _hp;

  //setter
  set hp(int value) {
    if (value < 0) {
      throw Exception('hp 는 0 보다 작을 수 없습니다');
    }
    _hp = value;
  }

  Hero2({required this.name, required int healPoint}) : _hp = healPoint;
}
