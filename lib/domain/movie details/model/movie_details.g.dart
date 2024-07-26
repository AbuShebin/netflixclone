// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) => MovieDetails(
      backdropPath: json['backdrop_path'] as String?,
      belongsToCollection: json['belongs_to_collection'] == null
          ? null
          : BelongsToCollection.fromJson(
              json['belongs_to_collection'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      imdbId: json['imdb_id'] as String?,
      originCountry: (json['originCountry'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      originalLanguage: json['original_language'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      runtime: (json['runtime'] as num?)?.toInt(),
      tagline: json['tagline'] as String?,
      title: json['title'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieDetailsToJson(MovieDetails instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'belongs_to_collection': instance.belongsToCollection,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'originCountry': instance.originCountry,
      'original_language': instance.originalLanguage,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'runtime': instance.runtime,
      'tagline': instance.tagline,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };

BelongsToCollection _$BelongsToCollectionFromJson(Map<String, dynamic> json) =>
    BelongsToCollection(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
    );

Map<String, dynamic> _$BelongsToCollectionToJson(
        BelongsToCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
    };
