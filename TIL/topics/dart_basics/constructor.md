다양한 생성자(constructor)
생성자란? = 인스턴스를 생성하는 방법을 제공함

`
class Hero{
String name;
int hp;
Hero(this.name, this.hp);
}
`

Named parameter = 생성자에 {}를 사용, null포함하지 않으면 required 붙임
`
// name과 hp는 필수 파라미터, nickname은 옵션
class Hero{
String name;
int hp;
String? nickname;
Hero({required this.name, required this.hp, this.nickname});
}
void main(){
final hero1 = Hero(name:'슈퍼맨', hp:100);
final hero2 = Hero(name:'슈퍼맨', hp:100, nickname:'망토남자');
}
`

필수 파라미터와 named 파라미터(옵셔널) 혼합
생성자에서 required는 named언급 안해도 됌
`
// name과 hp는 필수 파라미터, nickname은 옵션
class Hero{
String name;
int hp;
String? nickname;
Hero(this.name, this.hp, {this.nickname});
}
void main(){
final hero1 = Hero('슈퍼맨', hp:100);
final hero2 = Hero('베트맨', hp:80, nickname:'박쥐남자');
}
`