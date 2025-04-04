import 'package:collection/collection.dart';
import 'package:test/test.dart';

import '../../lib/2025-04-01/model/comment.dart';

void main() {
  const List<Map<String, dynamic>> mockComments = [
    {
      "postId": 76,
      "id": 379,
      "name": "est qui quos exercitationem",
      "email": "Afton.Medhurst@mina.info",
      "body":
          "laboriosam quia animi ut\nquasi aut enim sequi numquam similique fugiat voluptatum non\nsed velit quod nisi id quidem\nmagni in eveniet hic",
    },
  ];

  group('Comments 테스트', () {
    test('직렬화, 역직렬화 테스트', () {
      final comments = mockComments.map((e) => Comment.fromJson(e)).toList();
      final jsonList = comments.map((e) => e.toJson()).toList();
      final deserializationComments =
          jsonList.map((e) => Comment.fromJson(e)).toList();

      expect(ListEquality().equals(comments, deserializationComments), isTrue);
      expect(comments[0].name.isNotEmpty, deserializationComments.isNotEmpty);
    });
  });
}
