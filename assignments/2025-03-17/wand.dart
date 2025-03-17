void main() {
  // List<String> people = ['현수', '민수'];
  //
  // for (int i = 0; i < people.length; i++) {
  //   print(people[i]);
  // }
  // print('-----------');
  // for (final name in people) {
  //   print(name);
  // }
  // print('-----------');
  // people.forEach((name) {
  //   print(name);
  // });

  Map<String, dynamic> gildong = {'name': '홍길동', 'age': 20};
  final name = gildong['name']; // dynamic타입
  //final String name = gildong['name']; // 강제 타입 캐스팅
  final name2 = gildong['name'] as String; // 강제 타입 캐스팅

  gildong.entries.forEach((element) {
    print(element.key);
    print(element.value);
  });
}
