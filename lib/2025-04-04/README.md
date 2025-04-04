# 📝 과제 1. 동적 Json 처리 연습

🔗 **테스트 데이터
** : [마스크 재고 API 보기](https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json)

---

## ✅ 요구사항

### 1️⃣ DTO 작성

- 주어진 URL의 **JSON 데이터를 담을 수 있는 DTO 작성**
- **모든 필드를 누락없이 포함**할 것
- **Nullable 타입**을 적절히 사용할 것
- **인공지능의 도움 가능**

---

### 2️⃣ 도메인 모델 클래스 (Store) 정의

- **필요한 필드만 포함**할 것

---

### 3️⃣ Mapper 구현

- **DTO → 도메인 모델** 변환 로직 작성

---

### 4️⃣ DataSource & Repository 작성

- **유효한 데이터만 반환**하도록 구현

  (`remainStat`, `stockAt`, `createdAt`이 `null` 또는 빈 값인 경우 제외)

- **Mapper 활용**

---

# 📝 과제 2. DTO, Mapper 연습

## 데이터소스를 모델로 정의하기 어려운 경우 - 동적 JSON

```json
[
  {
    "id": 1,
    "type": "article",
    "title": "This is an article",
    "content": "This is the content of the article.",
    "created_at": "2020-01-01"
  },
  {
    "id": 2,
    "type": "image",
    "url": "https://example.com/image.jpg",
    "caption": "This is an image.",
    "created_at": "2020-02-02"
  },
  {
    "id": 3,
    "type": "video",
    "url": "https://example.com/video.mp4",
    "caption": "This is a video.",
    "created_at": "2020-03-03"
  }
]

```

## 서버에서 아예 잘못된 값을 보내는 경우

```json
[
  {
    "id": "1",
    "type": "article",
    "title": "This is an article",
    "content": "This is the content of the article.",
    "created_at": "2020-01-01"
  },
  {
    "id": 2,
    "type": null,
    "url": "https://example.com/image.jpg",
    "caption": "This is an image.",
    "created_at": "2020-02-02"
  },
  {
    "id": 3,
    "url": "https://example.com/video.mp4",
    "caption": "This is a video.",
    "created_at": "2020-03-03"
  }
]

```

🖼️ 위 형태로 JSON 데이터가 들어오는 경우를 처리할 수 있도록 다음을 작성하시오

---

## ✅ 요구사항

### 1️⃣ DTO 작성

- JSON 응답 구조와 정확히 매핑되는 **PhotoDto 클래스 작성**
- `created_at`은 **String**으로 받기

---

### 2️⃣ Model 클래스 작성

- `createdAt`은 **LocalDate 타입 사용**
- `type`은 **enum 클래스(Article, Image, Video, Unknown)** 로 구현

---

### 3️⃣ Mapper 클래스 작성

- **DTO → Model 변환 로직 구현**
- `type`이 없거나 잘못된 경우 **Unknown으로 처리**
- 날짜 형식 변환 처리 (String → LocalDate)

---

### 4️⃣ Repository 구현

- `MockPhotoDataSourceImpl` 를 사용하여 데이터 요청
- 응답 데이터를 **모델로 변환하여 반환**

---