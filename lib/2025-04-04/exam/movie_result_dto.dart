// Movie API 응답을 위한 DTO 클래스들

class MovieResultDto {
  final DatesDto? dates;
  final num? page;
  final List<MovieDto>? results;
  final num? totalPages;
  final num? totalResults;

  MovieResultDto({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieResultDto.fromJson(Map<String, dynamic> json) {
    return MovieResultDto(
      dates: json['dates'] != null ? DatesDto.fromJson(json['dates']) : null,
      page: json['page'],
      results: json['results'] != null
          ? List<MovieDto>.from(
          json['results'].map((x) => MovieDto.fromJson(x)))
          : null,
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dates != null) {
      data['dates'] = dates!.toJson();
    }
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((x) => x.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class DatesDto {
  final String? maximum;
  final String? minimum;

  DatesDto({
    this.maximum,
    this.minimum,
  });

  factory DatesDto.fromJson(Map<String, dynamic> json) {
    return DatesDto(
      maximum: json['maximum'],
      minimum: json['minimum'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maximum'] = maximum;
    data['minimum'] = minimum;
    return data;
  }
}

class MovieDto {
  final bool? adult;
  final String? backdropPath;
  final List<num>? genreIds;
  final num? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final num? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final num? voteAverage;
  final num? voteCount;

  MovieDto({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) {
    return MovieDto(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'] != null
          ? List<num>.from(json['genre_ids'])
          : null,
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    if (genreIds != null) {
      data['genre_ids'] = genreIds;
    }
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}