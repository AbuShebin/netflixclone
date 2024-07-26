part of 'movie_screen_bloc.dart';

@freezed
class MovieScreenState with _$MovieScreenState {
  const factory MovieScreenState({
    required String title,
    required String description,
    required String poster_path,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory MovieScreenState.initial() {
    return MovieScreenState(title: 'Movie title', description: 'Description', poster_path: 'Poster Path',hasError: false,isLoading: false);
  }
}
