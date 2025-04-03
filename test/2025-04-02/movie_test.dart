import 'package:modu_3_dart_study/2025-04-02/data_source/impl/movie_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-02/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/2025-04-02/mock/impl/mock_http_client_impl.dart';
import 'package:modu_3_dart_study/2025-04-02/mock/mock_http_client.dart';
import 'package:modu_3_dart_study/2025-04-02/model/movie.dart';
import 'package:modu_3_dart_study/2025-04-02/repository/moive_repository_impl.dart';
import 'package:modu_3_dart_study/2025-04-02/repository/movie_repository.dart';
import 'package:test/test.dart';

void main() async {
  const String apiUri =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1';
  const String mockTestUri =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1';

  test('[ TMDB API 호출 테스트 ]', () async {
    MovieDataSource movieDataSource = MovieDataSourceImpl(apiUri: apiUri);
    MovieRepository movieRepository = MovieRepositoryImpl(
      movieDataSource: movieDataSource,
    );

    List<Movie> movies = await movieRepository.getMovieInfoList();

    expect(movies.first.id, 1197306);
    expect(movies.first.title, '워킹 맨');
    expect(
      movies.first.overview,
      '전직 블랙 옵스 요원이었던 레본 케이드(제이슨 스타뎀)는 평범한 건설 노동자로 살아가며 딸과 함께 조용한 삶을 추구하고 있었으나 그의 상사의 딸이 인신매매 조직에 의해 납치되면서, 다시 과거의 전투 기술을 사용해 그녀를 구하기 위해 나서게 된다. 이 과정에서 시카고의 범죄 조직과 러시아 마피아와 얽히며, 부패와 폭력으로 가득 찬 어두운 세계를 마주하게 되는데...',
    );
    expect(movies.first.releaseDate, isNull);
  });

  test('[ Mock 호출 테스트 ]', () async {
    final MovieRepository movieRepository = MovieRepositoryImpl(
      movieDataSource: MovieDataSourceImpl(
        client: MockHttpClientImpl().creatMovieMockClient(apiUri),
        apiUri: mockTestUri,
      ),
    );

    List<Movie> movies = await movieRepository.getMovieInfoList();

    expect(movies.first.id, 1197306);
    expect(movies.first.title, 'A Working Man');
    expect(movies.first.overview, '전직 블랙 옵스 요원이었던 레본 케이드(제이슨 스타뎀)는 평범한 건설 노동자로 살아가며 딸과 함께 조용한 삶을 추구하고 있었으나 그의 상사의 딸이 인신매매 조직에 의해 납치되면서, 다시 과거의 전투 기술을 사용해 그녀를 구하기 위해 나서게 된다. 이 과정에서 시카고의 범죄 조직과 러시아 마피아와 얽히며, 부패와 폭력으로 가득 찬 어두운 세계를 마주하게 되는데...');
    expect(movies.first.releaseDate, '2025-03-26');
  });
}
