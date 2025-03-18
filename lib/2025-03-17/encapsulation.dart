void main() {
  Hero2 hero2 = Hero2(name: 'name', healPoint: 100);
  print(hero2.hp);

  hero2.hp = 200;
}

class Hero2 {
  String name;
  int _hp;

  int get hp => _hp;
  set hp(int value) {
    if(value < 0) {
      throw Exception('hp가 0보다 작음');
    }
    _hp = value;
  }

  Hero2({required this.name, required int healPoint}) : _hp = healPoint;
}