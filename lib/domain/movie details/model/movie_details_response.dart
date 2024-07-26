import 'package:json_annotation/json_annotation.dart';

part 'movie_details.g.dart';

@JsonSerializable()
class MovieDetailsResponse {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  BelongsToCollection? belongsToCollection;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'imdb_id')
  String? imdbId;
  List<String>? originCountry;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'popularity')
  double? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'runtime')
  int? runtime;
  @JsonKey(name: 'tagline')
  String? tagline;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;

  MovieDetailsResponse({
    this.backdropPath,
    this.belongsToCollection,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.runtime,
    this.tagline,
    this.title,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) {
    return _$MovieDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}

@JsonSerializable()
class BelongsToCollection {
  int? id;
  String? name;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  BelongsToCollection({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) {
    return _$BelongsToCollectionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);
}
