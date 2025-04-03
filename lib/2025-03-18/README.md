# 연습문제 1

이 클래스를 이용해, 다음 사양을 따르는 PoisonSlime 클래스를 작성하시오
1. 독 슬라임(PoisonSlime) 은, 슬라임 (Slime) 중에서도 특히 “독 공격" 이 되는 것
2. PoisonSlime 는 아래의 코드로 인스턴스화 되는 클래스임
PoisonSlime poisonSlime = PoisonSlime(‘A’);
3. PoisonSlime 독 공격 가능 횟수를 저장하는 poisonCount(초기값 5)를 가진다
4. PoisonSlime attack() 메소드가 호출되면 다음 내용의 공격을 한다.
a. 우선, “보통 슬라임과 같은 공격"을 한다
b. poisonCount가 0이 아니면 다음을 추가로 수행한다
c. 화면에 “추가로, 독 포자를 살포했다!” 를 표시
d. 용사의 HP 의 1/5에 해당하는 포인트를 용사의 HP 로부터 감소시키고, “~포인트의 데미지" 라고 표시
e. poisonCount 를 1 감소 시킨다
 
 --- 

# 연습문제 2

속성:
- mp: Int (초기값 100)
  
메서드:
- heal(hero: Hero): Unit의 hp를 20 회복시키고 자신의 mp를 10 소모
- mp가 부족하면 "마나가 부족합니다" 출력
- 힐을 성공하면 "힐을 시전했습니다. 대상 HP: ${hero.hp}" 출력

---

### 연습문제 3

- GreatWizard 클래스 요구사항:
  -  Wizard 클래스를 상속받음
- 속성:
  - mp가 150으로 증가
- 메서드:
  - superHeal(hero: Hero): Unit의 hp를 전부 회복시키고 자신의 mp를 50 소모
  - mp가 부족하면 "마나가 부족합니다" 출력
  - 힐을 성공하면 "슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}" 출력
