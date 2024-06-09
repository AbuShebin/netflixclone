import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixclone/application/bloc/downloads_event.dart';
import 'package:netflixclone/application/bloc/downloads_state.dart';
import 'package:netflixclone/domain/core/failures/main_failures.dart';
import 'package:netflixclone/domain/downloads/i_downloads_repo.dart';
import 'package:netflixclone/domain/downloads/models/downloads.dart';

@Injectable() 
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;

  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {

    on((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        downloadsFailureOptions: none(),
      ));

      final Either<MainFailures, List<Downloads>> downloadsOption =
          await _downloadsRepo.getDownloadsImages();

      print('$downloadsOption downloads bloc ---------------');

      emit(
        downloadsOption.fold(
          (failure) => state.copyWith(
              isLoading: false, downloadsFailureOptions: some(Left(failure))),
          (success) => state.copyWith(
              isLoading: false,
              downloads: success,
               downloadsFailureOptions: some(Right(success))),
        ),
      );
    });
  }
}