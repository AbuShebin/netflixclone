import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixclone/domain/core/failures/main_failures.dart';
import 'package:netflixclone/domain/hot%20and%20new/hot_and_new_response/hot_and_new_service.dart';
import 'package:netflixclone/domain/hot%20and%20new/hot_and_new_response/models/hot_and_new_rep.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    //on event getHomeScreenData...
    on<GetHomeScreenData>((event, emit) async {
      //send loading to ui
      emit(HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingTvList: [],
          tenseDramasMovieList: [],
          southIndianMovieList: [],
          isLoading: true,
          hasError: false));

//get data
      final _movieResult = await _homeService.getHotAndNewMovieData();

      final _tvResult = await _homeService.getHotAndNEwTvData();

//transform data
      final _state1 = _movieResult.fold(
        (MainFailures l) {
          print('HomeBloc movie failure print-->>>');
          return HomeState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: [],
              trendingTvList: [],
              tenseDramasMovieList: [],
              southIndianMovieList: [],
              isLoading: false,
              hasError: true);
        },
        (HotAndNewResponse r) {
          print('HomeBloc movie Success print-->>>');
          final pastYear = r.results;
          final trending = r.results;
          final dramas = r.results;
          final southIndian = r.results;
          pastYear.shuffle();
          trending.shuffle();
          dramas.shuffle();
          southIndian.shuffle();
          return HomeState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: pastYear,
              trendingTvList: state.trendingTvList,
              tenseDramasMovieList: dramas,
              southIndianMovieList: southIndian,
              isLoading: false,
              hasError: false);
        },
      );
      //send data to ui
      emit(_state1);

      final _state2 = _tvResult.fold(
        (MainFailures l) {
          print('HomeBloc tv Success print-->>>');
          return HomeState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: [],
              trendingTvList: [],
              tenseDramasMovieList: [],
              southIndianMovieList: [],
              isLoading: false,
              hasError: true);
        },
        (HotAndNewResponse r) {
          print('HomeBloc tv Success print-->>>');
          final top10List = r.results;

          return HomeState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: state.pastYearMovieList,
              trendingTvList: top10List,
              tenseDramasMovieList: state.tenseDramasMovieList,
              southIndianMovieList: state.southIndianMovieList,
              isLoading: false,
              hasError: false);
        },
      );

      //send data to ui
      emit(_state2);
    });
  }
}
