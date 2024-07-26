part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateId,
    required List<HotAndNewData> pastYearMovieList,
    required List<HotAndNewData> trendingTvList,
    required List<HotAndNewData> tenseDramasMovieList,
    required List<HotAndNewData> southIndianMovieList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HomeState.initial() => HomeState(
      stateId: '0',
      pastYearMovieList: [],
      trendingTvList: [],
      tenseDramasMovieList: [],
      southIndianMovieList: [],
      isLoading: false,
      hasError: false);
}
