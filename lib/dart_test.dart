void main() {
  final jinDo = Dog(10);
  Dog doJi = jinDo;
  final poMe = Dog(10);

  jinDo.age = 20;

  print(jinDo.age);
  print(doJi.age);
  print(poMe.age);
  print(jinDo == doJi);
  print(identical(jinDo, doJi));
  print(jinDo == poMe);
  print(identical(jinDo, poMe));
}

class Dog {
  int age;

  Dog(this.age);
}
