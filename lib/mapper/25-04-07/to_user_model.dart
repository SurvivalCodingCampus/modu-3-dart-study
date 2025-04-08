import '../../dto/25-04-07/user_dto.dart';
import '../../model/25-04-07/user.dart';

extension ToUserModel on UserDto {
  User toUserModel() {
    return User(
      id: id ?? '이름 없음',
      email: email ?? '이메일 없음',
      password: password ?? '비밀번호 없음',
      createAt: DateTime.parse(createAt ?? DateTime.now().toString()),
    );
  }
}
