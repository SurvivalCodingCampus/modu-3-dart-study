# 과제 설명

## 디버깅 연습문제

### 연습문제 1

<br>

- CollectionChartDataList, Collection, CollectionSalePrice 선언.
    - 필드 List<Collection>, List<CollectionSalePrice>는 리스트 선언
- 각각 toJson, fromJson 작성

<br>

### 첫 시도

<br>

```
CollectionChartDataList.fromJson(Map<String, dynamic> json)
  : collection =
        (json['collectionChartDataList'] as List).isNotEmpty // 빈 리스트인지 확인
            ? json['collectionChartDataList'] // as List 없이도 List임이 보장됨.
                .map((e) => Collection.fromJson(e)) // 전부 Json 변환
                .toList()
            : [];
```

<br>

- `null`인 경우에 **`as List`** 타입 캐스팅을 시도하면 변환될 수 없기 때문에 오류 발생

<br>

```
CollectionChartDataList.fromJson(Map<String, dynamic> json)
  : collection =
        (json['collectionChartDataList'] as List?)
            ?.map((e) => Collection.fromJson(e))
            .toList();
```

<br>

- List? nullable로 수정

<br>

### 두번째 시도

<br>

```
return {
  "collectionName": collectionName,
  "collectionSalePrice":
      collectionSalePrice?.map((e) => e.toJson()).toList(),
};
```

<br>

- json에 collectionSalePrice가 null인 데이터가 섞여 있었고, Json 비교 테스트에서 문제가 생김.

<br>

Expected: ... lection68","collecti ...  
Actual: ... lection68"},{"collec ...

<br>

```
return collectionSalePrice == null
    ? {"collectionName": collectionName}
    : {
        "collectionName": collectionName,
        "collectionSalePrice":
            collectionSalePrice?.map((e) => e.toJson()).toList(),
      };
```

<br>

- toJson()에 예외를 두어서 해결