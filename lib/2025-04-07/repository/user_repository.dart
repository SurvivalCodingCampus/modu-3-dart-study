import 'package:modu_3_dart_study/2025-04-07/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';
import 'package:modu_3_dart_study/2025-04-07/model/user.dart';
import 'package:modu_3_dart_study/dto_utils/dto_repository.dart';
import 'package:modu_3_dart_study/enums/registration_error.dart';

import '../../core/result.dart';

abstract class UserRepository
    extends DtoRepository<UserDto, User, UserDataSource> {
  UserRepository(super.dataSource, super.dto);

  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  });
}
