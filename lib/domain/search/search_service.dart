import 'package:dartz/dartz.dart';
import 'package:netflixclone/domain/core/failures/main_failures.dart';
import 'package:netflixclone/domain/search/models/search_response/search_response.dart';

abstract class SearchService {
  Future<Either<MainFailures, SearchResponse>> searchMoviews(
      {required String movieQuery});
}
