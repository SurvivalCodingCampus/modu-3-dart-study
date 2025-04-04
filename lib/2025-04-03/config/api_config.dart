import 'package:dotenv/dotenv.dart';

class ApiConfig {
  static final ApiConfig _instance = ApiConfig._internal();

  factory ApiConfig() => _instance;

  ApiConfig._internal();

  static DotEnv? _env;

  Future<void> init() async {
    _env = DotEnv()..load(['.env']);
  }

  static String? _apiKey() => _env?['API_KEY'] ?? '';

  static final String  todosUrlString = 'https://jsonplaceholder.typicode.com/todos';
  static String todoUrlString(int id) => 'https://jsonplaceholder.typicode.com/todos/$id';

  static String movieUrlString() => 'https://api.themoviedb.org/3/movie/upcoming?api_key=${_apiKey()}&language=ko-KR&page=1';
}
