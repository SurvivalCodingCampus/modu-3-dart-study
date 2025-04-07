import 'package:dotenv/dotenv.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/data_source/http_image_data_source.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  DotEnv env = DotEnv()..load();
  final String url = env['PIXABAY_API_URL']!;
  final String apiKey = env['PIXABAY_API_KEY']!;

  final http.Client client = http.Client();
  final HttpImageDataSource dataSource = HttpImageDataSource(client);

  test('정상적으로 이미지 정보가 맵 형태로 불러져와야한다.', () async {
    final List<Map<String, dynamic>> photos = await dataSource.fetch(
      '$url?key=$apiKey&q=yellow',
    );

    expect(photos, isNotEmpty);
  });
}
