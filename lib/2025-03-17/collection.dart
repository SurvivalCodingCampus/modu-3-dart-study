void main() {
  /* List */
  final names = <String>[];
  names.add('홍길동');
  names.add('신사임당');
  names.add('한석봉');
  names.add('춘향이');
  names.remove('신사임당');
  print(names.contains('신사임당'));

  // - 인덱스 활용
  for (int i = 0; i < names.length; i++) {
    print(names[i]);
  }
  // - 무지성 가져오기
  for (final name in names) {
    print(name);
  }
  // - forEach -> 당분간 사용하지 않기~
  names.forEach((name) {
    print(name);
  });
  names.forEach(print);

  /* Set */
  // - get 메서드를 제공하지 않음
  // Iterator 또는 forEach()를 사용
  Set<int> lottoSet = {2, 3};
  lottoSet.add(1);
  lottoSet.add(2); // => 중복오류
  lottoSet.add(4);
  lottoSet.remove(4);

  // List의 contains 보다 빠른 이유?
  print(lottoSet.contains(3));

  // Iterator
  final iterator = lottoSet.iterator;
  while (iterator.moveNext()) {
    print(iterator.current);
  }

  /* Map */
  // 키(key) : 값(value) 의 쌍으로 이루어진 요소를 담는 자료구조
  // 키의 중복은 허용되지 않음
  Map<String, dynamic> gildong = {'name': '홍길동', 'id': 0, 'age': 20};
  // Object는 안되고 dynamic을 쓰는 이유
  // Object는 null를 허용하지 않음!!! 크고 싶으면 Odject?
  final name = gildong['name'];
  int age = gildong['age'];

  final String name2 = gildong['name']; // 강제 타입 캐스팅(1)
  final name3 = gildong['name'] as String; // 강제 타입 캐스팅(2)

  print(gildong); // 전체
  print(gildong['name']); // value

  // entrise
  // -> 순서를 보장하지 않음
  gildong.entries.forEach(print);
  gildong.entries.forEach((element) {
    print(element.key);
  });
  gildong.entries.forEach((element) {
    print(element.value);
  });
}
