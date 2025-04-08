import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04/2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/data_source/mock_auth_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/dto/user_dto.dart';
import 'package:modu_3_dart_study/2025-04/mock/mock_client.dart'
    show mockClient;
import 'package:test/test.dart';

void main() {
  Map<String, dynamic> mockData = {
    "id": "1",
    "email": "test@test.com",
    "password": "password",
    "createdAt": "2025-04-07T14:00:00Z",
  };

  final http.Client client = mockClient(true, mockData);
  final AuthRemoteDataSource dataSource = MockAuthRemoteDataSourceImpl(client);

  test('registerUser를 호출하면 UserDto로 변환하여 반환해야한다.', () async {
    final UserDto dto = await dataSource.registerUser(
      email: "test@test.com",
      password: "password",
    );

    expect(dto.id, "1");
    expect(dto.email, "test@test.com");
    expect(dto.password, "password");
    expect(dto.createdAt, "2025-04-07T14:00:00Z");
  });
}
