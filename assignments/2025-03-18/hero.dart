class Hero {
  String name = "";
  double hp = 0;
  double maxHp = 100;

  Hero({required this.name, required this.hp});

  @override
  String toString() {
    return 'Hero{hp: $hp}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Hero &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          hp == other.hp;

  @override
  int get hashCode => name.hashCode ^ hp.hashCode;
}
