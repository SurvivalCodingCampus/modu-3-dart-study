# 과제 설명

## DTO, Mapper 연습문제

### 연습문제 1

<br>

- 필요한 정보만 넣을 Store 모델 클래스를 freezed로 작성
- Url의 모든 필드를 담을 수 있는 StoreDto를 JsonToDart 플러그인으로 작성
- StoreDto에서 필요한 정보만 null 처리후 Store에 담는 extension StoreMapper 작성
- Url을 받아와서 데이터를 StoreDto에 담는 StoreDataSourceImpl의 getStores 작성
- StoreRepositoryImpl에서 getStores 작성
    - where로 remainStat, stockAt, createdAt이 null 또는 빈값인 경우 제외
    - 나머지 데이터들은 Mapper toStore()로 전부 StoreDto에서 Store로 변환
- MockStoreDataSourceImpl 작성후 테스트