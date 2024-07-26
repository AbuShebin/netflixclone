import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixclone/domain/core/failures/main_failures.dart';
import 'package:netflixclone/domain/movie%20details/model/movie_details_response.dart';
import 'package:netflixclone/infrastructure/movie_details/movie_details_repository.dart';

part 'movie_screen_event.dart';
part 'movie_screen_state.dart';
part 'movie_screen_bloc.freezed.dart';

@injectable
class MovieScreenBloc extends Bloc<MovieScreenEvent, MovieScreenState> {
  final MovieDetailsRepository _movieDetailsRepository;
  MovieScreenBloc(this._movieDetailsRepository)
      : super(MovieScreenState.initial()) {
    on<MovieScreenEvent>((event, emit) async {
      emit(MovieScreenState(
          title: 'Movie title',
          description: "Description",
          poster_path: '',
          isLoading: true,
          hasError: false));

      final _result = await _movieDetailsRepository.getMovieDetails();

      final _state = _result.fold(
        (MainFailures l) {
          MovieScreenState(
              title: '',
              description: '',
              poster_path: '',
              isLoading: false,
              hasError: true);
        },
        (MovieDetailsResponse r) {
          MovieScreenState(
              title: r.title ?? 'title',
              description: r.overview ?? 'overview',
              poster_path: r.posterPath ?? '',
              isLoading: false,
              hasError: false);
        },
      );
      emit(_state);
    });
  }
}
