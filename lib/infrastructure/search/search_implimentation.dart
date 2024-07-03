import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixclone/domain/core/api_end_points.dart';
import 'package:netflixclone/domain/core/failures/main_failures.dart';
import 'package:netflixclone/domain/downloads/models/downloads.dart';
import 'package:netflixclone/domain/search/models/search_response/search_response.dart';
import 'package:netflixclone/domain/search/search_service.dart';

@LazySingleton(as: SearchService) 
class SearchImpl implements SearchService{
  @override
  Future<Either<MainFailures, SearchResponse>> searchMoviews({required String movieQuery}) async{

  try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.search,queryParameters: {
            'query': movieQuery
          });

      if (response.statusCode == 200 || response.statusCode == 201) {
       
       final result = SearchResponse.fromJson(response.data);

        return right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }

    // TODO: implement searchMoviews
    throw UnimplementedError();
  }
 
}