void main() {
  Map<String, dynamic> park = {
    'age': 20,
    'name': '박성민',
  };

  final String name = park['name']; // 강제 타입 캐스팅, 타입이 없으면 dynamic
  int age = park['age'];

  final name2 = park['name'] as String; // 강제 타입 캐스팅
}