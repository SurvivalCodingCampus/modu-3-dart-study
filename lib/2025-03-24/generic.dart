class Hero implements Comparable<Hero> {
  String name;
  int hp;

  Hero(this.name, this.hp);

  @override
  String toString() {
    return 'Hero(name: $name, hp: $hp)';
  }

  @override
  int compareTo(Hero other) => name.compareTo(other.name);
}

void main() {
  final heroes = [Hero('Iron Man', 100), Hero('Hulk', 200), Hero('Thor', 150)];

  heroes.sort();
  print(heroes);
}
