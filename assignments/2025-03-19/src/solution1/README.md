# 과제 설명

## 과제

<br>

- Book과 Computer가 동일하게 가지는 필드는 TangibleAsset 추상 클래스에서 정리 가능하다.
- color는 유형자산만이 가지는 특징이므로 Asset에는 해당하지 않는다.
- 무게는 유형자산만이 가지는 특징이고 따라서 TangibleAsset은 무게를 가진다.
- Thing에서 getter, setter를 추상 프로퍼티로 작성하고 TangibleAsset에서 override 하여 구현한다.

<br>

## 생각해본 문제

<br>

```dart
abstract class TangibleAsset extends Asset implements Thing{
  String color;
  double weight;

  TangibleAsset(super.name, super.price, this.color, this.weight);
}
```

<br>

- 이런 방식으로 작성한 경우 필드가 그냥 하나 생성된 것과 동일하고, Thing을 지워도 무방했다.
- `double _weight` 로 재작성하여 getter와 setter를 override 하는 식으로 수정했다.