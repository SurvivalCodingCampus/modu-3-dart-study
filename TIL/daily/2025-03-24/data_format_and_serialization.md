## **데이터 형식**

### **1. CSV (Comma Separated Values)**

- 데이터를 **콤마(,)**로 구분한 형식
- 간결하고 표 형태의 데이터를 표현하기에 적합
- 주로 간단한 데이터 저장이나 파일 간 데이터 전송에 사용

```dart
String str = '홍길동,한석봉,신사임당';
```

---

### **2. Properties 형식**

- *키(key)와 값(value)**의 쌍으로 데이터를 관리하는 형식
- 주로 설정 파일에서 사용됨
- Dart에서는 직접 Properties 클래스를 구현하거나 외부 라이브러리로 사용

**예시 데이터**:

```dart
heroName = '홍길동'
heroHp = 100
```

---

### **3. XML (eXtensible Markup Language)**

- **<> 태그를 활용**한 데이터 표현 방식
- **포함 관계**를 명확히 표현할 수 있음
- 데이터를 설계하거나 저장, 전송할 때 유용
- **DOM Parser, SAX Parser** 등을 이용해 파일을 분석
    - **SAX Parser**가 더 빠름

**예시 데이터**:

```xml
<heroes>
  <hero>
    <name>홍길동</name>
    <hp>100</hp>
  </hero>
  <hero>
    <name>신사임당</name>
    <hp>200</hp>
  </hero>
</heroes>
```

---

### **4. JSON (JavaScript Object Notation)**

- **네트워크 통신에서 가장 많이 사용**되는 데이터 형식
- XML보다 용량이 적음
    - **[ ]**: 리스트 형태
    - **{ }**: 객체 형태
- **키(key): 값(value)** 쌍으로 데이터를 관리
- Dart에서는 **Map<String, dynamic>** 데이터와 유사
- JSON 직렬화를 통해 Dart 클래스와 데이터를 매핑 가능

**예시 데이터**:

```dart
{
  "heroes": [
    {"name": "홍길동", "hp": 100},
    {"name": "신사임당", "hp": 200}
  ]
}
```

---

## **📌 직렬화와 역직렬화**

### 📍**직렬화 (Serialization)**

- **데이터 구조**나 **객체 상태**를 **저장 가능**하거나 **전송 가능**한 포맷(문자열, 바이트 스트림 등)으로 변환하는 과정
- 데이터를 파일로 저장하거나 통신에 용이한 형태로 변환할 수 있음
- Dart에서는 JSON 직렬화를 통해 주로 클래스 데이터를 JSON으로 변환

**→ 직렬화 예시**: Dart 클래스 → JSON

```dart
class Hero {
  String name;
  int hp;

  Hero(this.name, this.hp);

  Map<String, dynamic> toJson() => {
    "name": name,
    "hp": hp,
  };
}
```

---

### 📍**역직렬화 (Deserialization)**

- **직렬화된 데이터**를 다시 **원래 객체로 복원**하는 과정
- Dart에서는 JSON 데이터를 클래스에 매핑하여 사용

**→ 역직렬화 예시**: JSON → Dart 클래스

```dart
Hero fromJson(Map<String, dynamic> json) {
  return Hero(json['name'], json['hp']);
}
```

---

### 📍**직렬화와 역직렬화의 흐름**

| **변환 방향** | **설명** |
| --- | --- |
| **직렬화** | 클래스 → JSON (데이터를 파일로 저장) |
| **역직렬화** | JSON → 클래스 (파일 데이터를 활용) |

---
