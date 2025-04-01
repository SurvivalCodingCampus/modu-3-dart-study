import '../comment_datasource.dart';

class MockCommentDatasourceImpl implements CommentDatasource {
  final List<Map<String, dynamic>> _mockData = [
    {
      "postId": 1,
      "id": 1,
      "name": "이말년",
      "email": "duckking@webtoon.kr",
      "body": "아 이건 좀 선 넘었죠;; 개발자가 이렇게까지 해야 합니까?",
    },
    {
      "postId": 1,
      "id": 2,
      "name": "신입 개발자",
      "email": "fresh.dev1998@gmail.com",
      "body": "Git 충돌났는데 왜 저만 해결하죠? 팀플이잖아요 팀플!!",
    },
    {
      "postId": 2,
      "id": 3,
      "name": "코드리뷰요정",
      "email": "pr.fairy@reviewhub.dev",
      "body": "변수명이 왜 이래요? 진짜로 물어보는 거예요. 왜요?",
    },
    {
      "postId": 2,
      "id": 4,
      "name": "기획자 민수",
      "email": "planner.minsu@company.com",
      "body": "이 버튼은 누르면 눌리는 건가요? 아니면 눌렀다고 생각하게 만드는 건가요?",
    },
    {
      "postId": 3,
      "id": 5,
      "name": "디자이너 주희",
      "email": "zoohee.uiux@figma.io",
      "body": "어차피 다 파란색인데 왜 버튼 색을 나눴죠? 기준이 뭐예요?",
    },
    {
      "postId": 3,
      "id": 6,
      "name": "팀장님",
      "email": "leader.park@corp.com",
      "body": "그거 어제까지라고 했잖아~ (말한 적 없음)",
    },
    {
      "postId": 4,
      "id": 7,
      "name": "사수 없는 사수",
      "email": "ghost.mentor@alone.dev",
      "body": "이건 그냥 구글링으로 해보면 될 것 같은데?",
    },
    {
      "postId": 4,
      "id": 8,
      "name": "연차신청봇",
      "email": "dayoff@hr.system",
      "body": "이 연차는 사유가 없습니다. 그냥 쉬고 싶었습니다. 안 되나요?",
    },
    {
      "postId": 5,
      "id": 9,
      "name": "야근요정",
      "email": "midnight.coder@burnout.dev",
      "body": "오늘도 빌드 돌리면서 라면 먹는 중입니다. 행복...한가?",
    },
    {
      "postId": 5,
      "id": 10,
      "name": "QA 폭격기",
      "email": "tester.boom@qa.com",
      "body": "버튼 눌렀는데 앱 꺼져요. 또요. 이번엔 진짜로 또요.",
    },
  ];

  @override
  Future<List<Map<String, dynamic>>> fetchComments() async {
    return Future.value(_mockData);
  }
}
