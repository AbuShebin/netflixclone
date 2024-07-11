import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixclone/domain/core/api_end_points.dart';
import 'package:netflixclone/domain/core/failures/main_failures.dart';
import 'package:netflixclone/domain/hot%20and%20new/hot_and_new_response/hot_and_new_service.dart';
import 'package:netflixclone/domain/hot%20and%20new/hot_and_new_response/models/hot_and_new_rep.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImplementation implements HotAndNewService{

  @override
  Future<Either<MainFailures, HotAndNewResponse>> getHotAndNewMovieData() async{
      try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints.hotAndNewMovie);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('success response in search implimentation======>>>>>');

        final result = HotAndNewResponse.fromJson(response.data);

        print("success reponse print");

        return right(result);
      } else {
        print(
            "something went wrong in search implimentation.dart=====->>>>>>>>>>");
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }
  }

  @override
  Future<Either<MainFailures, HotAndNewResponse>> getHotAndNEwTvData() async{
    try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints.hotAndNewTv);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('success response in search implimentation======>>>>>');

        final result = HotAndNewResponse.fromJson(response.data);

        print("success reponse print");

        return right(result);
      } else {
        print(
            "something went wrong in search implimentation.dart=====->>>>>>>>>>");
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }
  }

}