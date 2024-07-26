import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixclone/domain/core/api_end_points.dart';
import 'package:netflixclone/domain/core/failures/main_failures.dart';
import 'package:netflixclone/domain/movie%20details/model/movie_details_response.dart';
import 'package:netflixclone/domain/movie%20details/movie_details_service.dart';

@LazySingleton(as: MovieDetailsService)
class MovieDetailsRepository implements MovieDetailsService {
  @override
  Future<Either<MainFailures, MovieDetailsResponse>>
      getMovieDetails() async {
    try {
      final Response response = await Dio().get(ApiEndPoints.movieDetails);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = MovieDetailsResponse.fromJson(response.data);

        return right(result);
      } else {
        return left(MainFailures.serverFailure());
      }
    } catch (e) {
      return left(MainFailures.clientFailure());
    }
  }
}
