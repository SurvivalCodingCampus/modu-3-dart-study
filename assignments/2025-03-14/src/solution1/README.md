# 과제 설명

### 불가능 코드

```
  static final int maxHP = 50;
  static final int maxMP = 10;

  String name;
  int hp;
  int mp;

  Cleric (this.name, {this.hp = Cleric.maxHP, this.mp = Cleric.maxMP}); // 생성자
```

<br>

- 클래스와 생성자는 컴파일 타임에 결정됨.
- 정적 변수(static)은 런타임에 결정됨. final 도 런타임에 결정됨.
- 따라서 컴파일 타임에 정적 변수가 존재하지 않기 때문에 생성자의 기본값으로 사용할 수 없음.

## <br>

### 잘못된 해결책

- 정적 메서드에서 설정할 수 없나 하고 해봤는데 정적 메서드도 런타임에 결정되기 때문에 결국 비슷한 방법이었다.

<br>

### 해결책

static const : static const로 선언하면 값이 컴파일 타임에 결정되고 인스턴스 변수의 기본값으로 사용 가능하다.

```
  static const int maxHP = 50;
  static const int maxMP = 10;

  String name;
  int hp;
  int mp;

  Cleric(this.name, {this.hp = maxHP, this.mp = maxMP});
```

<br>

<br>

초기화 리스트 : 생성 시에는 nullable로 생성 한 후. 런타임에 static 변수를 받아 초기화

```
  static final int maxHP = 50;
  static final int maxMP = 10;

  String name;
  int hp;
  int mp;

  //초기화 리스트. 생성 시에는 nullable로 생성 한 후. 런타임에 static 변수를 받아 초기화
  Cleric(this.name, {int? hp, int? mp})
      : hp = hp ?? maxHP,
        mp = mp ?? maxMP;
```

<br>

- 생성 시에는 nullable로 생성 한 후. 런타임에 static 변수를 받아 초기화
- 객체가 완전히 생성되지 않아서 this는 사용 불가능
- 초기화 리스트 내에서는 this 사용 불가