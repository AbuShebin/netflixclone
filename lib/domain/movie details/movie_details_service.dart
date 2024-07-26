import 'package:dartz/dartz.dart';
import 'package:netflixclone/domain/core/failures/main_failures.dart';
import 'package:netflixclone/domain/movie%20details/model/movie_details_response.dart';

abstract class MovieDetailsService {
Future<Either<MainFailures, MovieDetailsResponse>> getMovieDetails();
}