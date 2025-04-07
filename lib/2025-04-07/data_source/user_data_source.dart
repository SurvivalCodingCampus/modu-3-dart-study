import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';
import 'package:modu_3_dart_study/2025-04-07/model/user.dart';
import 'package:modu_3_dart_study/dto_utils/dto_data_source.dart';

abstract class UserDataSource extends DtoDataSource<UserDto, User> {
  UserDataSource(super.httpUrl, super.dto, {super.client});

  Future<UserDto> registerUser({
    required String email,
    required String password,
  });
}
