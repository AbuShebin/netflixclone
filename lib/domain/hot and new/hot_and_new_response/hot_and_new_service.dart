import 'package:dartz/dartz.dart';
import 'package:netflixclone/domain/core/failures/main_failures.dart';
import 'package:netflixclone/domain/hot%20and%20new/hot_and_new_response/models/hot_and_new_rep.dart';

abstract class HotAndNewService {
  Future<Either<MainFailures, HotAndNewResponse>> getHotAndNewMovieData();

  Future<Either<MainFailures, HotAndNewResponse>> getHotAndNEwTvData();
}
