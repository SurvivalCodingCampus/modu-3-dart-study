/* 이름과 태어난 해를 생성자로 받는다 (name, birthYear)
이름과 태어난 해는 한번 정해지면 수정이 불가능하다. -> final
age  프로퍼티를 통해 나이를 제공하지만, 임의로 수정은 불가능하다. -> get
나이 계산은 올해년도에서 birthYear 년도를 뺀 값을 리턴한다. return = (birthYear - 올해년도)
현재 시간과 날짜는 DateTime 클래스를 활용하면 얻을 수 있다.
 */

class Person {
  final String name ;
  final int birthYear ;

  Person(this.name, this.birthYear);

  int get age{
    final now = DateTime.now().year;
    return now - birthYear;
  }
}

void main() {
  Person person = Person("Shin Chan", 1994);

  print("이름:  ${person.name}, 출생연도 : ${person.birthYear}, 나이 ${person.age}") ;

 }



